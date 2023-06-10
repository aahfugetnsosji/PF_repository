class Region < ApplicationRecord
  # モデル間のアソシエーション
  has_many :posts,       dependent: :destroy
  has_many :prefectures, dependent: :destroy
  
  # 親子孫関係にあるテーブルを一度に保存する
  accepts_nested_attributes_for :posts
  accepts_nested_attributes_for :prefectures
  
  # 地方区分をenumで記述
  enum region_name: {
    北海道・東北:0, 関東:1, 北陸・甲信越:2, 東海:3,
    関西:4, 中国:5, 四国:6, 九州・沖縄:7
  }
end
