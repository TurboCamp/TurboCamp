# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    commenter { 'MyString' }
    content { nil }
    message { nil }
  end
end
