class Region < ApplicationRecord
  # モデル間のアソシエーション
  has_many :posts
  has_many :prefectures
end
