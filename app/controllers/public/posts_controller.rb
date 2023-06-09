class Public::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @tags = Tag.all
    @region = Region.new
    @prefectures = @region.prefectures.build
    @prefectures.post_prefectures.build
    @posts = @region.posts.build
    @posts.user_id = current_user.id
    @posts.post_tags.build
    @posts.post_prefectures.build
  end

  def show
    @post = Post.find(params[:id])
    @region = @post.region_id
    @post_tags = @post.post_tags.all
    @post_prefectures = @post.post_prefectures.all
  end

  def edit
    @post = Post.find(params[:id])
    @region = @post.region_id
    @prefectures = @region.prefectures.build
    @prefectures.post_prefectures.build
    @posts = @region.posts.build
    @posts.user_id = current_user.id
    @posts.post_tags.build
    @posts.post_prefectures.build
  end
  
  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.destroy
      redirect_to mypage_path
      flash[:notice] = "投稿を削除しました。"
    else
      render :show
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body, :image, :region_id, :user_id)
  end
end
