class Organization < ApplicationRecord
  resourcify

  include Authority::Abilities

  self.authorizer_name = 'OrganizationAuthorizer'

  has_and_belongs_to_many :users
  has_many :contacts

  validates :name, presence: true

  def contacts
    Contact.find_by_organization(self.id)
  end
end
