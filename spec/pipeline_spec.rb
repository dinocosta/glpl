require 'glpl'

RSpec.describe GLPL::Pipeline, "#initialize" do
  it "correctly initializes attributes" do
    data = {
      "id" => "1",
      "sha" => "sha",
      "ref" => "master",
      "status" => "failed",
      "web_url" => "https://github.com/joaofcosta/glpl"
    }
    pipeline = GLPL::Pipeline.new(data)

    expect(pipeline.id).to eq data["id"]
    expect(pipeline.sha).to eq data["sha"]
    expect(pipeline.ref).to eq data["ref"]
    expect(pipeline.status).to eq data["status"]
    expect(pipeline.url).to eq data["web_url"]
  end
end
