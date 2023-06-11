class Tag < ApplicationRecord
  # モデル間のアソシエーション
  has_many :post_tags
end
