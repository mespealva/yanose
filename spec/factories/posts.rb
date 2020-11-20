# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :post do |f|
    association :user, factory: :user
    f.body { Faker::Alphanumeric.alpha }
    f.title { Faker::Alphanumeric.alpha }
  end
end
