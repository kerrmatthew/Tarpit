class CreateDownloadCounters < ActiveRecord::Migration
  def self.up
    create_table :download_counters, :id => false do |t|
      t.integer :fossil_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :download_counters
  end
end
