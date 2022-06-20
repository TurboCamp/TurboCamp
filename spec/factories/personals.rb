FactoryBot.define do
  factory :personal do
    association :user
    association :project
  end
end