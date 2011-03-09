class AddCollectionIdToFossil < ActiveRecord::Migration
  def self.up
    add_column :fossils, :collection_id, :integer
  end

  def self.down
    remove_column :fossils, :collection_id
  end
end
