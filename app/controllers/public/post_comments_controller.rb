class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = post.id
    if comment.save
      flash[:notice] = "コメントを投稿しました。"
      redirect_to post_path(post)
    else
      @post = Post.find(params[:post_id])
      @post_comment = PostComment.new
      @post_comments = @post.post_comments.all
      flash[:alert] = "コメントを投稿できませんでした。"
      render template: "public/posts/show"
    end
  end

  def destroy
    post_comment = PostComment.find(params[:id])
    if post_comment.user_id == current_user.id
      post_comment.destroy
      flash[:notice] = "コメントを削除しました。"
      redirect_to post_path(params[:post_id])
    else
      @post = Post.find(params[:post_id])
      @post_comment = PostComment.new
      @post_comments = @post.post_comments.all
      flash[:alert] = "コメントを削除できませんでした。"
      render template: "public/posts/show"
    end
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
