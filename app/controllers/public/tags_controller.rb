class Public::TagsController < ApplicationController
  def index
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
    @tags = Tag.all
    @regions = Region.all
    @prefectures = Prefecture.all
  end
end
