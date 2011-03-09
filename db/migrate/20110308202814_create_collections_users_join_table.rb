class CreateCollectionsUsersJoinTable < ActiveRecord::Migration
  def self.up
    create_table :collections_users, :id => false do |t|
      t.integer :collection_id
      t.integer :user_id
    end
  end

  def self.down
    drop_table :collections_users
  end
end