# frozen_string_literal: true

class Bucket < ApplicationRecord
  has_rich_text :content
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :project
  has_many :documents , dependent: :destroy

  def self.all_status
    [
      %w[草稿 draft],
      %w[發佈 published]
    ]
  end
end
