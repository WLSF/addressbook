class Contact
  #resourcify

  include ActiveAttr::Model
  include Authority::Abilities
  include FirebaseHelper

  attribute :id
  attribute :name
  attribute :organization_id

  attr_accessor :id, :name, :organization_id

  validates :name, presence: true

  def self.all
    FirebaseHelper.get()
  end

  def self.find(*args)
    FirebaseHelper.get(args[0])
  end

  def self.find_by_organization(organization_id)
    FirebaseHelper.get_by_organization(organization_id)
  end

  def save
    self.id = FirebaseHelper.push(self)
    self
  end

  def self.update(id, attributes = [])
    obj = Contact.new(attributes)
    obj.id = id

    FirebaseHelper.put(obj)
  end
end
