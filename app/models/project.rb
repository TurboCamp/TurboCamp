class Project < ApplicationRecord
  after_create :create_chat_room
  include Slugable
  
#  與user多對多關聯
  has_many :personals
  has_many :users , through: :personals  , dependent: :destroy

# 在project內部功能
  has_one :chat_room , dependent: :destroy
  has_many :buckets, dependent: :destroy
  has_many :messages , dependent: :destroy
  has_one :schedule,  dependent: :destroy
  has_many :todo_lists, dependent: :destroy
  
  validates :title , presence: true , uniqueness: true
  validates :description , presence: true , length:{maximum: 50}
  
  def normalize_friendly_id(value)
    value.to_s.parameterize(preserve_case: true)
  end
end
