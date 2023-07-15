class Admin::TagsController < ApplicationController
  def index
    @tags = Tag.page(params[:page])
    @tag = Tag.new
  end

  def create
    tag = Tag.new(tag_params)
    tag.save
    redirect_to admin_tags_path, notice: "タグを追加しました。"
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    tag = Tag.find(params[:id])
    tag.update(tag_params)
    redirect_to admin_tags_path, notice: "タグを編集しました。"
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    redirect_to admin_tags_path, notice: "タグを削除しました。"
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
