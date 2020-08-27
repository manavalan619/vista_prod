class FileUploader < CarrierWave::Uploader::Base
  def store_dir
    "imports/#{model.id}"
  end
end
