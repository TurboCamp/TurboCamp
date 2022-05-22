class ImageUploader < Shrine 
  plugin :download_endpoint, prefix: "images"
  Attacher.validate do
      validate_mime_type %w[image/jpeg image/png image/webp]
      validate_max_size 5*1024*1024
  end
end