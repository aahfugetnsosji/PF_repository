class Public::PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
    @tags = Tag.all
    @regions = Region.all
    @prefectures = Prefecture.all
    @post.user_id = current_user.id
    @post.post_tags.build
    @post.post_prefectures.build
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @post.post_comments.all
  end
  
  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save!
      redirect_to post_path(@post.id)
      flash[:notice] = "投稿しました。"
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @tags = Tag.all
    @regions = Region.all
    @prefectures = Prefecture.all
  end
  
  def update
    post = Post.find(params[:id])
    post.user_id = current_user.id
    post.update(post_params)
    redirect_to post_path(post.id)
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
  
  def search
    @posts = Post.search(params[:keyword]).order(created_at: :desc)
  end
  
  private
  
  def post_params
    params.require(:post).permit(
      :title, :body, :image, :region_id, :user_id,
      post_tags_attributes: { tag_ids: [] },
      post_prefectures_attributes: { prefecture_ids: [] }
    ).merge(user_id: current_user.id)
  end
end