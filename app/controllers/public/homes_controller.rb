class Public::HomesController < ApplicationController
  def top
    # 最新の投稿12件を取得
    @latest_posts = Post.order(created_at: :desc).limit(12)
    @tags = Tag.all
    @regions = Region.all
    @prefectures = Prefecture.all
  end

  def about
  end
end
