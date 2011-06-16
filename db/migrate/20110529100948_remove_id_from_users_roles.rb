class RemoveIdFromUsersRoles < ActiveRecord::Migration
  def self.up
    remove_column :users_roles, :id
  end

  def self.down
    add_column :users_roles, :id, :integer
  end
end
