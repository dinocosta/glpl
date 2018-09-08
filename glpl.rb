#!/Users/joaocosta/.rvm/rubies/ruby-2.2.1/bin/ruby

require 'json'
require 'net/http'
require 'colorize'

PROJECTS        = Hash[*(`echo $GLPL_PROJECT_IDS`.strip().split(",").map { |p| p.split(":")}).flatten]
STATUS_COLORS   = {"success": :green, "failed": :red, "running": :yellow}
METHOD_CLASSES  = {get: Net::HTTP::Get, post: Net::HTTP::Post}
API_URL         = "https://gitlab.com/api/v4/projects/4677522"
PRIVATE_TOKEN   = `echo $GITLAB_PRIVATE_TOKEN`.strip()

if PRIVATE_TOKEN == "" then
  puts "Gitlab's Private Token is not set. Please set it to $GITLAB_PRIVATE_TOKEN.".colorize(:red)
  exit
end

def request(endpoint, method)
  uri     = URI("#{API_URL}#{endpoint}")

  Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
    request                   = METHOD_CLASSES[method].new(uri)
    request["PRIVATE-TOKEN"]  = PRIVATE_TOKEN
    response                  = http.request(request)

    return JSON.parse(response.body)
  end
end

def jobs(pipeline_id)
  jobs      = request("/pipelines/#{pipeline_id}/jobs", :get)

  for job in jobs do
    puts sprintf(
      "%s %s %s",
      job["name"].to_s.colorize(:blue).ljust(50),
      job["user"]["username"].ljust(10),
      job["status"].colorize(STATUS_COLORS[job["status"].to_sym]).ljust(10))
  end
end

if ARGV[0] == "jobs" then
  jobs(ARGV[1])
  exit
end

pipelines = request("/pipelines", :get)

for pipeline in pipelines do
  puts sprintf(
    "%s %s %s",
    pipeline["id"].to_s.colorize(:blue).ljust(10),
    pipeline["ref"].ljust(50),
    pipeline["status"].colorize(STATUS_COLORS[pipeline["status"].to_sym]).ljust(10))
end

