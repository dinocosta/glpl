require 'minitest/autorun'
require 'glpl'
require 'date'

class JobTest < Minitest::Test
  def test_job_initializatino
    data = {
      "id" => "1",
      "status" => "failed",
      "stage" => "test",
      "name" => "test_authentication",
      "ref" => "master",
      "created_at" => "2018-09-21T16:20:20.000Z",
      "username" => "tommywiseau"
    }
    job = GLPL::Job.new(data)

    assert_equal job.id, data["id"]
    assert_equal job.status, data["status"]
    assert_equal job.stage, data["stage"]
    assert_equal job.name, data["name"]
    assert_equal job.ref, data["ref"]
    assert_equal job.created_at, DateTime.parse(data["created_at"])
    assert_equal job.username, data["username"]
  end
end
