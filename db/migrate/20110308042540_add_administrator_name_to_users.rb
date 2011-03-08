class AddAdministratorNameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :administrator, :boolean
    add_column :users, :name, :string
  end

  def self.down
    remove_column :users, :name
    remove_column :users, :administrator
  end
end
