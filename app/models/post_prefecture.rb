class PostPrefecture < ApplicationRecord
  # モデル間のアソシエーション
  belongs_to :post
  belongs_to :prefecture
end
