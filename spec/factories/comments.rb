# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :comment do |f|
    association :user, factory: :user
    association :post, factory: :post
    f.body { Faker::Alphanumeric.alpha }
  end
end
