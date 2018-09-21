class GLPL::Pipeline

  attr_reader :id, :sha, :ref, :status, :url

  def initialize(pipeline_data)
    @id     = pipeline_data["id"]
    @sha    = pipeline_data["sha"]
    @ref    = pipeline_data["ref"]
    @status = pipeline_data["status"]
    @url    = pipeline_data["web_url"]
  end
end
