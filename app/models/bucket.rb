# frozen_string_literal: true

class Bucket < ApplicationRecord
  has_rich_text :content, dependent: :destroy
  has_one_attached :attach, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :project

  def self.all_status
    [
      %w[草稿 draft],
      %w[發佈 published]
    ]
  end
end
