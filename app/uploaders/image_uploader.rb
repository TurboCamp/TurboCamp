
class ImageUploader < ApplicationUploader
  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)
 
    { 
      large:  magick.resize_to_limit!(800, 800),
      medium: magick.resize_to_limit!(150, 150),
      small:  magick.resize_to_limit!(30, 30),
    }
    validate_mime_type %w[image/jpeg image/png image/webp]
  end
end