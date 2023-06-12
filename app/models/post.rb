class Post < ApplicationRecord
  
  # 画像を投稿できるようにする
  has_one_attached :image
  
  # モデル間のアソシエーション
  belongs_to :user
  belongs_to :region
  
  has_many :reports # 通報は履歴として残す
  has_many :post_comments,    dependent: :destroy
  has_many :favorites,        dependent: :destroy
  has_many :post_tags,        dependent: :destroy
  has_many :post_prefectures, dependent: :destroy
  
  # 親子孫関係にあるテーブルを一度に保存する
  accepts_nested_attributes_for :post_tags
  accepts_nested_attributes_for :post_prefectures
  
  # 投稿画像
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/NoImage.jpg')
      image.attach(io: File.open(file_path), filename: 'NoImage.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  # キーワード検索でユーザが入力した値と部分一致するデータを取得
  def self.search(keyword)
    Post.where(['body like?', "%#{keyword}%"])
  end
    
end
