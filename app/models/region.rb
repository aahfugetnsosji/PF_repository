class Region < ApplicationRecord
  # モデル間のアソシエーション
  has_many :posts
  has_many :prefectures
  
  # 地方区分をenumで記述
  enum name: {
    hokkaido_tohoku: 0,
    kanto: 1,
    hokuriku_koshinetsu: 2,
    tokai: 3,
    kansai: 4,
    chugoku: 5,
    shikoku: 6,
    kyusyu_okinawa: 7
  }
end
