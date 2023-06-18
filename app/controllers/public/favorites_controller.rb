class Public::FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    favorite.save
    flash[:notice] = "ブックマークに登録しました。"
    redirect_to post_path(post)
  end
  
  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
    flash[:notice] = "ブックマークを削除しました。"
    redirect_to post_path(post)
  end
end
