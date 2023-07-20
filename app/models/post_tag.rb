class PostTag < ApplicationRecord
  # モデル間のアソシエーション
  belongs_to :post
  belongs_to :tag
  
  # post_idが空でないかを確認
  validates :post_id, presence: true
  # tag_idが重複していないかを確認
  validates :tag_id, uniqueness: { scope: :post }
end
