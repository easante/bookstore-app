class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.string :name, limit: 50

      t.timestamps
    end
    add_index :publishers, :name, unique: true
  end
end
