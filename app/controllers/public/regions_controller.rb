class Public::RegionsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @posts = params[:region_id].present? ? Region.find(params[:region_id]).posts : Post.all
    @tags = Tag.all
    @regions = Region.all
    @prefectures = Prefecture.all
  end
end
