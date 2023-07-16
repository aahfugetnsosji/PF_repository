class Admin::PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page]).per(20)
  end

  def show
    @post = Post.find(params[:id])
    @post_comments = @post.post_comments.all
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      flash[notice] = "投稿を削除しました。"
      redirect_to admin_posts_path
    else
      @post = Post.find(params[:id])
      @post_comments = @post.post_comments.all
      render :show, alert: "投稿の削除に失敗しました。"
    end
  end
end
