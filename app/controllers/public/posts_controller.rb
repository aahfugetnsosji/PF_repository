class Public::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search]
  before_action :find_post, only: [:show, :edit]

  def index
    @posts = Post.order(created_at: :desc).page(params[:page])
  end

  def new
    @post = Post.new
  end

  def show
    @post_comment = PostComment.new
    @post_comments = @post.post_comments.all
  end

  def create
    @post = Post.new(post_params)
    # ユーザが選択したタグ・都道府県データをtag_ids/prefecture_idsとして受け取り、空のデータを削除する
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
      @post = Post.new(post_params)
      @tags = Tag.all
      @regions = Region.all
      @prefectures = Prefecture.all
      flash[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  def edit
    unless @post.user_id == current_user.id
      redirect_to post_path(@post)
    end
  end

  def update
    post = Post.find(params[:id])
    unless post.user_id == current_user.id
      redirect_to post_path(post)
    end
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
      @post = Post.find(params[:id])
      @tags = Tag.all
      @regions = Region.all
      @prefectures = Prefecture.all
      flash[:alert] = "投稿の更新に失敗しました。"
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
      @post = Post.find(params[:id])
      @post_comment = PostComment.new
      @post_comments = @post.post_comments.all
      flash[:alert] = "投稿の削除に失敗しました。"
      render :show
    end
  end

  def search
    @posts = Post.search(params[:keyword]).page(params[:page])
    @all_posts = Post.search(params[:keyword]).order(created_at: :desc)
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

  def find_post
    @post = Post.find(params[:id])
  end
end