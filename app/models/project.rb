class Project < ApplicationRecord

  after_create :create_chat_room
  after_create :create_schedule

  include Slugable
  
#  與user多對多關聯
  has_many :personals
  has_many :users , through: :personals  , dependent: :destroy
  has_one :chat_room , dependent: :destroy
  has_many :users , through: :personals 

# 在project內部功能
  has_one :chat_room
  has_one :bucket, dependent: :destroy
  has_many :messages , dependent: :destroy
  has_one :schedule,  dependent: :destroy
  
  validates :title , presence: true , uniqueness: true
  validates :description , presence: true , length:{maximum: 50}
  validates :nickname , presence: true
  
  def normalize_friendly_id(value)
    value.to_s.parameterize(preserve_case: true)
  end
end
