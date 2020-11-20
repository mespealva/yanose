# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password }
    f.username { Faker::Internet.username }
  end
end
