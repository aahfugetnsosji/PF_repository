class CreatePrefectures < ActiveRecord::Migration[6.1]
  def change
    create_table :prefectures do |t|

      t.string :prefecture_name
      t.integer :region_id, null: false

      t.timestamps
    end
  end
end
