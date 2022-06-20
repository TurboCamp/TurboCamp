FactoryBot.define do
  factory :project do
    title { Faker::Team.state }
    description { Faker::Lorem.sentence(word_count: 5) }

    after :create do |project|
      create_list(:chat_room ,1, project:project)
    end
  end
end