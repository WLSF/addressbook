module Api
  module V1
    class ContactSerializer < ActiveModel::Serializer
      attributes :id, :name
    end
  end
end
