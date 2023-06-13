class PostPrefecture < ApplicationRecord
  # モデル間のアソシエーション
  belongs_to :post
  belongs_to :prefecture
  
  # post_idが空でないかを確認
  validates :post_id, presence: true
  # prefecture_idが重複していないかを確認
  validates :prefecture_id, uniqueness: { scope: :post }
end
