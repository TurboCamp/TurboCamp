
class ImageUploader < ApplicationUploader
  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)
 
    { 
      large:  magick.resize_to_limit!(800, 800),
      medium: magick.resize_to_limit!(150, 150),
      small:  magick.resize_to_limit!(30, 30),
    }
  end
  Attacher.validate do
    puts get.mime_type
    validate_max_size 5*1024*1024, message: "is too large (max is 5 MB)"
    validate_mime_type_inclusion %w[image/jpeg image/png image/gif]
  end
end