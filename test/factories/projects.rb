# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    nickname { 'MyString' }
    member { 'MyString' }
    useremail { 'MyString' }
    user { nil }
  end
end
