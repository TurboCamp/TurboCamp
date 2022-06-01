class PrivateChat < ApplicationRecord
  belongs_to :project
  has_many :user_privates
  has_many :user , through: :user_privates , dependent: :destroy

end
