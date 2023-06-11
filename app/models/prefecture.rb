class Prefecture < ApplicationRecord
  # モデル間のアソシエーション
  belongs_to :region
  has_many :post_prefectures, dependent: :destroy
end
