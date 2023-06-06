class CreatePostPrefectures < ActiveRecord::Migration[6.1]
  def change
    create_table :post_prefectures do |t|
      
      t.integer :post_id      , null: false
      t.integer :prefecture_id, null: false

      t.timestamps
    end
  end
end
