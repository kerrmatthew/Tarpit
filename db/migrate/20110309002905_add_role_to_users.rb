class AddRoleToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :role, :string
    remove_column :users, :administrator
  end

  def self.down
    remove_column :users, :role
    add_column :users, :administrator, :boolean
  end
end
