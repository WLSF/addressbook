class RemoveOrganizationFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_reference :users, :organization, foreign_key: true
  end
end
