class PostTag < ApplicationRecord
  # モデル間のアソシエーション
  belongs_to :post
  belongs_to :tag
end
