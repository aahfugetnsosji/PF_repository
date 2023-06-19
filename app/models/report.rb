class Report < ApplicationRecord
  # モデル間のアソシエーション
  belongs_to :post
  
  # 通報理由
  
end
