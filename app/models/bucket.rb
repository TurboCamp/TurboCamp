class Bucket < ApplicationRecord
  has_rich_text :content
  has_one_attached :attach 

end
