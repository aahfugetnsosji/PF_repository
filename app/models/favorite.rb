class Favorite < ApplicationRecord
  # モデル間のアソシエーション
  belongs_to :user
  belongs_to :post

  # バリデーション
  validates :user_id, presence: true
  validates :post_id, presence: true
end
