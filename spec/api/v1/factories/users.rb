module Api
  module V1
    FactoryGirl.define do
      factory :user do
        name { Faker::HarryPotter.character }
        email { Faker::Internet.email }
        password { "password" }
        password_confirmation { "password" }
      end
    end
  end
end
