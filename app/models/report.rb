class Report < ApplicationRecord
  # モデル間のアソシエーション
  # 外部キーのnilを許可する
  belongs_to :post, optional: true
  
  # バリデーション
  validates :reason, presence: true
  validates :body, presence: true

  # 通報理由
  enum reason: {
    illegal: 0,                       #違法行為
    offensive_content: 1,             #攻撃的な内容
    promote_discrimination: 2,        #差別助長
    spam: 3,                          #スパム
    impersonation: 4,                 #なりすまし
    copyright: 5,                     #著作権
    personal_information: 6,          #個人情報(肖像権含む)
    other_violations_of_the_terms: 7, #その他利用規約違反
    other_inappropriate_content: 8    #その他不適切なコンテンツ
  }
end