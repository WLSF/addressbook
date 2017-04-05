module Api
  module V1
    FactoryGirl.define do
      factory :organization do
        name { Faker::Company.name }
      end
    end
  end
end
