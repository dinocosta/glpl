require 'date'

class GLPL::Job

  attr_reader :id, :status, :stage, :name, :ref, :created_at, :username

  def initialize(job_data)
    @id         = job_data["id"]
    @status     = job_data["status"]
    @stage      = job_data["stage"]
    @name       = job_data["name"]
    @ref        = job_data["ref"]
    @created_at = DateTime.parse(job_data["created_at"])
    @username   = job_data["username"]
  end

end
