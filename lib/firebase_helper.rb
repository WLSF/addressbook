module FirebaseHelper

  base_uri = "https://addressbook-contacts.firebaseio.com"

  $firebase = Firebase::Client.new(base_uri)

  def self.push(value)
    response = $firebase.push("contacts", {
      :name             => value.name,
      :organization_id  => value.organization_id,
      :created          => Firebase::ServerValue::TIMESTAMP,
      :updated          => Firebase::ServerValue::TIMESTAMP
    })

    if response.success?
      if response.body.include?('name')
        obj = {:id=>response.body['name'], :name=>value.name, :organization_id=>value.organization_id}
        obj = Contact.new(obj)
        response = $firebase.push("organizations/#{obj.organization_id}/#{obj.id}", "#{obj.name}")
        if response.success?
          obj.id
        end
      end
    end
  end

  def self.get(id = nil)
    if id
      response = $firebase.get("contacts/#{id}")

      obj = {:id=>id, :name=>response.body['name'], :organization_id=>response.body['organization_id']}
      Contact.new(obj)
    else
      response = $firebase.get("contacts")

      contacts = []

      # The rails-firebase library returns nil when the key doesn't exists.
      if response.body
        response.body.each do |v|

          obj = {:id=>v[0], :name=>v[1]['name'], :organization_id=>v[1]['organization_id']}
          contacts << Contact.new(obj)
        end
      end
      contacts
    end
  end

  def self.put(obj)
    old_obj = self.get(obj.id)

    response = $firebase.update("contacts/#{obj.id}", {
      :name             => obj.name,
      :organization_id  => obj.organization_id,
      :updated          => Firebase::ServerValue::TIMESTAMP
    })

    if response.success?
      $firebase.delete("organizations/#{old_obj.organization_id}/#{obj.id}")
      $firebase.push("organizations/#{obj.organization_id}/#{obj.id}", "#{obj.name}")

      obj
    end
  end

  def self.get_by_organization(id)
    response = $firebase.get("organizations/#{id}")

    if !response.success?
      return false
    end
    contacts = []

    # The rails-firebase library returns nil when the key doesn't exists.
    if response.body
      response.body.each do |v|
        obj = {:id=>v[0], :name=>v[1].to_a[0][1], :organization_id=>id}
        contacts << Contact.new(obj)
      end
    end
    contacts
  end
end
