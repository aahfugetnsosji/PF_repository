class PostComment < ApplicationRecord
  # モデル間のアソシエーション
  belongs_to :user
  belongs_to :post

  # バリデーション
  validates :comment, presence: true
  validates :post_id, presence: true
  validates :user_id, presence: true
end
