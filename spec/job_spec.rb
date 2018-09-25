require 'glpl'

RSpec.describe GLPL::Job, "#initialize" do
  it "correctly initializes attributes" do
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

    expect(job.id).to eq data["id"]
    expect(job.status).to eq data["status"]
    expect(job.stage).to eq data["stage"]
    expect(job.name).to eq data["name"]
    expect(job.ref).to eq data["ref"]
    expect(job.created_at).to eq DateTime.parse(data["created_at"])
    expect(job.username).to eq data["username"]
  end
end
