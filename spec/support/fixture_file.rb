def fixture_file(file_name)
  Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'fixtures', file_name), 'image/jpg')
end
