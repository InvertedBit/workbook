class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :name
      t.string :text
      t.integer :type_id
      t.integer :sorting

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
