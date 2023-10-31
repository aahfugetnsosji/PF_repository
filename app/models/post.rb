class Post < ApplicationRecord

  # 画像を投稿できるようにする
  has_one_attached :image

  # モデル間のアソシエーション
  belongs_to :user
  belongs_to :region

  has_many :reports, foreign_key: 'post_id' # 通報は履歴として残す
  has_many :post_comments,    dependent: :destroy, foreign_key: 'post_id'
  has_many :favorites,        dependent: :destroy, foreign_key: 'post_id'
  has_many :post_tags,        dependent: :destroy, foreign_key: 'post_id'
  has_many :post_prefectures, dependent: :destroy, foreign_key: 'post_id'

  # 投稿は複数のタグと都道府県を持つ。それぞれpost_tagsとpost_prefecturesを通じて参照可能
  has_many :tags,        through: :post_tags
  has_many :prefectures, through: :post_prefectures

  # 親子孫関係にあるテーブルを一度に保存する(無くても可)
  accepts_nested_attributes_for :post_tags
  accepts_nested_attributes_for :post_prefectures

  # バリデーション
  validates :title, presence: true
  validates :body, presence: true
  validates :region_id, presence: true
  validates :user_id, presence: true

  # 投稿画像
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/post-image.png')
      image.attach(io: File.open(file_path), filename: 'post-image.png', content_type: 'image/png')
    end
    image
  end

  # キーワード検索でユーザが入力した値と部分一致するデータを取得
  def self.search(keyword)
    Post.where(['body like?', "%#{keyword}%"])
  end

  # 同じユーザが同じ投稿に複数お気に入りできないよう、user_idがFaboritesテーブルに存在するかどうか
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # タグ編集メソッド(destroy_allを使うタイプ)
  def save_tag(post_tags_params)
    if post_tags_params.empty?
      post_tags.destroy_all
    end
    # 送信されたタグが空でない場合、その投稿の既存のタグをすべて削除
    unless post_tags_params.empty?
      self.post_tags.destroy_all

      post_tags_params.each do |new|
        # 送信された各タグについて、PostTagモデルから既存のタグを検索し、存在しない場合は新しく作成
        new_post_tag = PostTag.find_or_create_by(post_id: :id, tag_id: new)

        #同じタグを登録するとエラーになるので、include?で回避
        unless self.post_tags.include?(new_post_tag)
          # 左のオブジェクト(post_tags)に右のオブジェクト(new_post_tag)を追加
          self.post_tags << new_post_tag
        end
      end
    end
  end

  # 都道府県編集メソッド(タグと同様)
  def save_prefecture(prefectures_params)
    if prefectures_params.empty?
      post_prefectures.destroy_all
    end

    unless prefectures_params.empty?
      self.post_prefectures.destroy_all

      prefectures_params.each do |new|
        new_post_prefecture = PostPrefecture.find_or_create_by(post_id: :id, prefecture_id: new)

        #同じ都道府県を登録するとエラーになるので、include?で回避
        unless self.post_prefectures.include?(new_post_prefecture)
          self.post_prefectures << new_post_prefecture
        end
      end
    end
  end

end
