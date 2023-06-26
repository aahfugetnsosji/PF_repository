class Public::RegionsController < ApplicationController
  def index
    @posts = params[:region_id].present? ? Region.find(params[:region_id]).posts : Post.all
    @tags = Tag.all
    @regions = Region.all
    @prefectures = Prefecture.all
  end
end
