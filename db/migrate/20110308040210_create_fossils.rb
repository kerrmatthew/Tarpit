class CreateFossils < ActiveRecord::Migration
  def self.up
    create_table :fossils do |t|
      t.string :name
      t.text :description
      t.date :date_available_from
      t.date :date_available_to

      t.timestamps
    end
  end

  def self.down
    drop_table :fossils
  end
end
