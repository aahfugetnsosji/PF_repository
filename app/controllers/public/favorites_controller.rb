class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    if favorite.save
      flash[:notice] = "ブックマークに登録しました。"
      redirect_to post_path(post)
    else
      @post = Post.find(params[:post_id])
      flash[:alert] = "ブックマークに登録できませんでした。"
      render template: "public/posts/show"
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    if favorite.destroy
      flash[:notice] = "ブックマークを解除しました。"
      # 削除後のリダイレクト先を直前のページに指定、直前のページに戻れなかった際はtopページに
      redirect_back fallback_location: root_path
    else
      @post = Post.find(params[:post_id])
      @favorite = current_user.favorites.find_by(post_id: post.id)
      flash[:alert] = "ブックマークを解除できませんでした。"
      render template: "public/posts/show"
    end
  end
end
