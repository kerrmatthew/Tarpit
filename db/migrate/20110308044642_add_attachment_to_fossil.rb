class AddAttachmentToFossil < ActiveRecord::Migration
  def self.up
    add_column :fossils, :attachment_file_name, :string
    add_column :fossils, :attachment_content_type, :string
    add_column :fossils, :attachment_file_size, :integer
    add_column :fossils, :attachment_uploaded_at, :datetime
  end

  def self.down
    remove_column :fossils, :attachment_uploaded_at
    remove_column :fossils, :attachment_file_size
    remove_column :fossils, :attachment_content_type
    remove_column :fossils, :attachment_file_name
  end
end
