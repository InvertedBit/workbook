class AddNameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :username, :string
    add_column :users, :prename, :string
    add_column :users, :name, :string
  end

  def self.down
    remove_column :users, :name
    remove_column :users, :prename
    remove_column :users, :username
  end
end
