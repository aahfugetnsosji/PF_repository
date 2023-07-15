class Public::RegionsController < ApplicationController
  def index
    @posts = params[:region_id].present? ? Region.find(params[:region_id]).posts.page(params[:page]) : Post.page(params[:page])
    @all_posts = params[:region_id].present? ? Region.find(params[:region_id]).posts : Post.all
    @tags = Tag.all
    @regions = Region.all
    @prefectures = Prefecture.all
  end
end
