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
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      @post.update(region_params)
      redirect_to post_path(@post)
      flash[:notice] = "投稿内容を編集しました。"
    else
      render mypage_path
    end
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
