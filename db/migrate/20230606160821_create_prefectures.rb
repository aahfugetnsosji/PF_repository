class CreatePrefectures < ActiveRecord::Migration[6.1]
  def change
    create_table :prefectures do |t|
      
      t.integer :name,      null: false
      t.integer :region_id, null: false

      t.timestamps
    end
  end
end
