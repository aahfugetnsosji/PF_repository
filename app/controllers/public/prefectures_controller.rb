class Public::PrefecturesController < ApplicationController
  def index
    @posts = params[:prefecture_id].present? ? Prefecture.find(params[:prefecture_id]).posts.page(params[:page]) : Post.page(params[:page])
    @all_posts = params[:prefecture_id].present? ? Prefecture.find(params[:prefecture_id]).posts : Post.all
    @tags = Tag.all
    @regions = Region.all
    @prefectures = Prefecture.all
  end
end
