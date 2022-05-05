class Project < ApplicationRecord

  include Slugable
  has_many :users
  has_many :personals
  has_many :teammate , through: :personals , source: :user

  validates :title , presence: true
  validates :description , presence: true , length:{maximum: 50}
  validates :nickname , presence: true

  def normalize_friendly_id(value)
    value.to_s.parameterize(preserve_case: true)
  end
end
