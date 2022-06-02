# frozen_string_literal: true

class User < ApplicationRecord
  include Slugable
  include AvatarUploader::Attachment(:avatar)

  belongs_to :project
  has_many :personals
  has_many :projects, through: :personals, dependent: :destroy
  has_many :user_privates
  has_many :private_chats, through: :user_privates, dependent: :destroy
  has_many :contents
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2 github]

  def self.create_from_provider_data(provider_data)
    where(email: provider_data.info.email).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      user.nickname = provider_data.info.name
      user.provider = provider_data.provider
      user.uid = provider_data.uid
      user.imageurl = provider_data.info.image
    end
  end

  def normalize_friendly_id(value)
    value.to_s.parameterize(preserve_case: true)
  end
end
