class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
    @tags = Tag.all
    @regions = Region.all
    @prefectures = Prefecture.all
  end

  def new
    @post = Post.new
    @tags = Tag.all
    @regions = Region.all
    @prefectures = Prefecture.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @post.post_comments.all
  end

  def create
    @post = Post.new(post_params)
    tag_ids = post_tags_params[:tag_ids]
    tag_ids.delete("")
    prefecture_ids = prefectures_params[:prefecture_ids]
    prefecture_ids.delete("")
    if @post.valid?
      @post.save!
      tag_ids.each do |tag_id|
        PostTag.create(post_id:@post.id,tag_id:tag_id)
      end
      prefecture_ids.each do |prefecture_id|
        PostPrefecture.create(post_id:@post.id,prefecture_id:prefecture_id)
      end
      flash[:notice] = "投稿しました。"
      redirect_to post_path(@post.id)
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
    @post = Post.find(params[:id])
    tag_ids = post_tags_params[:tag_ids]
    tag_ids.delete("")
    prefecture_ids = prefectures_params[:prefecture_ids]
    prefecture_ids.delete("")
    if @post.update(post_params)
      # save_tagはモデルに記述、53行目で空のパラメータを削除した後の値を引数に指定
      @post.save_tag(tag_ids)
      # save_prefectureはモデルに記述、55行目で空のパラメータを削除した後の値を引数に指定
      @post.save_prefecture(prefecture_ids)
      flash[:notice] = "投稿を更新しました。"
      redirect_to post_path(@post.id)
    else
      @tags = Tag.all
      @regions = Region.all
      @prefectures = Prefecture.all
      render :edit
    end
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
    params.require(:post).permit(:title, :body, :image, :region_id, :user_id,
      post_tags_attributes: { tag_ids: [] },
      post_prefectures_attributes: { prefecture_ids: [] }
    ).merge(user_id: current_user.id)
  end

  def post_tags_params
    params.require(:post).permit(tag_ids:[])
  end

  def prefectures_params
    params.require(:post).permit(prefecture_ids:[])
  end
end