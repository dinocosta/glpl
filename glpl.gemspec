Gem::Specification.new do |spec|
  spec.name        = "glpl"
  spec.version     = "0.0.2"
  spec.date        = Time.now.strftime("%Y-%m-%d")
  spec.summary     = "Gitlab Pipelines on your command line."
  spec.description = "Gitlab Pipelines on your command line."
  spec.authors     = ["Dino"]
  spec.email       = "dinojoaocosta@gmail.com"
  spec.files       = ["lib/glpl.rb"] + Dir["lib/glpl/*.rb"]
  spec.license     = "MIT"
  spec.homepage    = "https://github.com/joaofcosta/glpl"
  spec.metadata     = {"source_code_url" => "https://github.com/joaofcosta/glpl"}
  spec.executables << "glpl"
end
