class Public::RegionsController < ApplicationController
  def index
  end

  def create
    region = Region.new(region_params)
    if region.valid?
      region.save!
      redirect_to mypage_path
    else
      render :index
    end
  end
  
  def update
    @region = Region.find(params[:id])
    if @region.post.user_id == current_user.id
      @region.update(region_params)
      redirect_to post_path(@region.post.id)
      flash[:notice] = "投稿内容を編集しました。"
    else
      render mypage_path
    end
  end
  
  def destroy
    @region = Region.find(params[:id])
    @region.destroy
    redirect_to mypage_path
  end

  private

  def region_params
    params.require(:region).permit(
      :region_name,
      prefectures_attributes: [:prefecture_name, :region_id,
        post_prefectures_attributes: [:post_id, :prefecture_id]
      ],
      posts_attributes: [:title, :body, :image, :region_id, :user_id,
        post_tags_attributes: [:post_id, :tag_id]
      ]
    )
  end
end
