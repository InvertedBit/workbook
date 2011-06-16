class CreateUsersRoles < ActiveRecord::Migration
  def self.up
    create_table :users_roles do |t|
      t.integer :user_id
      t.integer :role_id

      t.timestamps
    end
  end

  def self.down
    drop_table :users_roles
  end
end
