class CreateFossilsUsersJoinTable < ActiveRecord::Migration
  def self.up
    create_table :fossils_users, :id => false do |t|
      t.integer :fossil_id
      t.integer :user_id
    end
  end

  def self.down
    drop_table :fossils_users
  end
end
