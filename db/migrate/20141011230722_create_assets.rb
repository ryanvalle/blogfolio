class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.text :file
      t.integer :user_id

      t.timestamps
    end
  end
end
