class AddPublicToCollection < ActiveRecord::Migration
  def self.up
    add_column :collections, :public, :boolean
  end

  def self.down
    remove_column :collections, :public
  end
end
