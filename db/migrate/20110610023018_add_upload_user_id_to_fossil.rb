class AddUploadUserIdToFossil < ActiveRecord::Migration
  def self.up
    add_column :fossils, :upload_user_id, :integer
  end

  def self.down
    remove_column :fossils, :upload_user_id
  end
end
