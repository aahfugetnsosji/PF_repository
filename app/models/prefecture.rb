class Prefecture < ApplicationRecord
  # モデル間のアソシエーション
  belongs_to :region
  has_many :post_prefectures, dependent: :destroy, foreign_key: 'prefecture_id'
  # 都道府県は投稿を複数持つ。post_prefecturesを通して参照可能
  has_many :posts, through: :post_prefectures
end
