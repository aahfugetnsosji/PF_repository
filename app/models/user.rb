class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # プロフィール画像を持たせる
  has_one_attached :profile_image

  # モデル間のアソシエーション
  has_many :posts,         dependent: :destroy, foreign_key: 'user_id'
  has_many :post_comments, dependent: :destroy, foreign_key: 'user_id'
  has_many :favorites,     dependent: :destroy, foreign_key: 'user_id'

  # バリデーション
  validates :name, presence: true

  # プロフィール画像
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      profile_image.attach(io: File.open(file_path), filename: 'no_image.png', content_type: 'image/png')
    end
    profile_image.variant(resize_to_fill: [width, height]).processed
  end

  # ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end
end
