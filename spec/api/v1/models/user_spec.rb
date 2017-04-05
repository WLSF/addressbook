require 'rails_helper'

module Api
  module V1
    describe User, type: :model do
      #it { should have_many_and_belong_to_many(:organizations) }

      it { should validate_presence_of(:name) }

      it { should validate_presence_of(:email) }

      it { should validate_presence_of(:password) }
      it { should validate_length_of(:password).is_at_least(8).is_at_most(20) }

      it { should validate_presence_of(:password) }
      it { should validate_length_of(:password).is_at_least(8).is_at_most(20) }

    end
  end
end
