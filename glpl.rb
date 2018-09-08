#!/Users/joaocosta/.rvm/rubies/ruby-2.2.1/bin/ruby

require 'json'
require 'net/http'
require 'colorize'

ATTRIBUTE_COLORS  = {success: :green, failed: :red, running: :yellow, id: :blue}
METHOD_CLASSES    = {get: Net::HTTP::Get, post: Net::HTTP::Post}
PRIVATE_TOKEN     = `echo $GITLAB_PRIVATE_TOKEN`.strip()
COLORS            = ARGV.include? "--colors"

# --- FUNCTIONS

class String
  def colorize_attribute(attribute)
    if COLORS then return colorize(ATTRIBUTE_COLORS[attribute]) else return colorize(:nil) end
  end
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
      job["name"].colorize_attribute(:name).ljust(50),
      job["user"]["username"].ljust(10),
      job["status"].colorize_attribute(job["status"].to_sym).ljust(10))
  end
end

def project_id
  return PROJECTS[PROJECT]
end

# --- SCRIPT

if PRIVATE_TOKEN == "" then
  puts "Gitlab's Private Token is not set. Please set it to $GITLAB_PRIVATE_TOKEN.".colorize(:red)
  exit
end

unless ARGV[0]
  puts "You must specify a project name using: $ glpl [PROJECT_NAME]"
  exit
else
  PROJECTS  = Hash[*(`echo $GLPL_PROJECT_IDS`.strip().split(",").map { |p| p.split(":")}).flatten]
  API_URL   = "https://gitlab.com/api/v4/projects/#{PROJECTS[ARGV[0]]}"
end

if ARGV[0] == "jobs" then
  jobs(ARGV[1])
  exit
end

pipelines = request("/pipelines", :get)

for pipeline in pipelines do
  puts sprintf(
    "%s %s %s",
    pipeline["id"].to_s.colorize_attribute(:id).ljust(10),
    pipeline["ref"].ljust(70),
    pipeline["status"].colorize_attribute(pipeline["status"].to_sym).ljust(10))
end

