class RenameCollectionsUsersToCollectionUserJoins < ActiveRecord::Migration
  def self.up
    rename_table :collections_users, :collection_user_joins
    
    add_column :collection_user_joins, :id, :primary_key
    
    change_table :collection_user_joins do |t|
      t.boolean :can_upload
      t.timestamps
    end
  end

  def self.down
    rename_table :collection_user_joins, :collections_users
    
    change_table :collection_user_joins do |t|
      t.remove :id
      t.remove :can_upload
      t.remove_timestamps
    end
    
  end
end
