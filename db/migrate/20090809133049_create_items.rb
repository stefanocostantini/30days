class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.text :notes
      t.string :url
      t.boolean :old
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
