class Admin::PostCommentsController < ApplicationController
  def destroy
    post_comment = PostComment.find(params[:id])
    if post_comment.destroy
      flash[:notice] = "コメントを削除しました。"
      redirect_to admin_post_path(params[:post_id])
    else
      @post = Post.find(params[:id])
      @post_comments = @post.post_comments.all
      flash[:alert] = "コメントを削除できませんでした。"
      render templete: "admin/posts/show"
    end
  end
end
