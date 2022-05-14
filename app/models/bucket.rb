class Bucket < ApplicationRecord
  has_rich_text :content
  has_one_attached :attach 
  has_many :comments, as: :commentable


  validates :title, presence: true

  def self.all_status
    [
      ["草稿", "draft"],
      ["發佈", "published"],
    ]
  end


end
