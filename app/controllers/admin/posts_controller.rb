class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comments = @post.post_comments.all
  end
  
  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to admin_posts_path
      flash[notice] = "投稿を削除しました。"
    else
      render :show, alert: "投稿の削除に失敗しました。"
    end
  end
end
