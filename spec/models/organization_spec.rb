require 'rails_helper'

describe Organization, type: :model do
  it { should have_many_and_belong_to_many(:users) }

  it { should validate_presence_of(:name) }
end
