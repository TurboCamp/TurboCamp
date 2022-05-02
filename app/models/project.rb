class Project < ApplicationRecord
  has_many :users
  has_many :user_projects
  has_many :teammate , through: :user_projects , source: :user
end
