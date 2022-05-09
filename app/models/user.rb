class User < ApplicationRecord


  include Slugable
  
  
  has_many :projects
  has_many :personals
  has_many :own_projects , through: :personals , source: :project
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
          :omniauthable, omniauth_providers: [:google_oauth2 , :github]

  scope :manager, -> { where(role: 'admin') }
  scope :teammate, -> { where(role: 'user') }

   def self.create_from_provider_data(provider_data)
    where(email: provider_data.info.email).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      # user.name = provider_data.info.last_name
      user.provider = provider_data.provider
      user.uid = provider_data.uid
    end
  end
  def normalize_friendly_id(value)
    value.to_s.parameterize(preserve_case: true)
  end
  
  
end
