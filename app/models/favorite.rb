class Favorite < ApplicationRecord
  # モデル間のアソシエーション
  belongs_to :user
  belongs_to :post
end
