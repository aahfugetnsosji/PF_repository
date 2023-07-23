class Admin::TagsController < ApplicationController
  def index
    @tags = Tag.page(params[:page]).per(15)
    @tag = Tag.new
  end

  def create
    tag = Tag.new(tag_params)
    if tag.save
      flash[:notice] = "タグを追加しました。"
      redirect_to admin_tags_path
    else
      @tags = Tag.page(params[:page])
      @tag = Tag.new
      flash[:alert] = "タグを追加できませんでした。"
      render :index
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    tag = Tag.find(params[:id])
    if tag.update(tag_params)
      flash[:notice] = "タグを編集しました。"
      redirect_to admin_tags_path
    else
      @tag = Tag.find(params[:id])
      flash[:alert] = "タグを更新できませんでした。"
      render :edit
    end
  end

  def destroy
    tag = Tag.find(params[:id])
    if tag.destroy
      flash[:notice] = "タグを削除しました。"
      redirect_to admin_tags_path
    else
      @tags = Tag.page(params[:page])
      @tag = Tag.new
      flash[:alert] = "タグを削除できませんでした。"
      render :index
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
