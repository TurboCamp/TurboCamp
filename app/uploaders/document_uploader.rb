
require "image_processing/mini_magick"

class DocumentUploader < Shrine
  plugin :download_endpoint, prefix: "documents"
  Attacher.validate do
    puts get.mime_type
    validate_max_size 5*1024*1024, message: "is too large (max is 5 MB)"
    validate_mime_type_inclusion %w[image/jpeg image/png image/gif]
  end

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)
    { 
      large:  magick.resize_to_limit!(800, 800),
      medium: magick.resize_to_limit!(500, 500),
      small:  magick.resize_to_limit!(150, 150),
    }
  end
end