require 'minitest/autorun'
require 'glpl'

class PipelineTest < Minitest::Test
  def test_pipeline_initialization
    data = {
      "id" => "1",
      "sha" => "sha",
      "ref" => "master",
      "status" => "failed",
      "web_url" => "https://github.com/joaofcosta/glpl"
    }
    pipeline = GLPL::Pipeline.new(data)

    assert_equal pipeline.id, data["id"]
    assert_equal pipeline.sha, data["sha"]
    assert_equal pipeline.ref, data["ref"]
    assert_equal pipeline.status, data["status"]
    assert_equal pipeline.url, data["web_url"]
  end
end
