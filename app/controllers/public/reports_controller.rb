class Public::ReportsController < ApplicationController
  before_action :authenticate_user!

  def new
    post = Post.find(params[:post_id])
    unless post.user_id != current_user.id
      redirect_to post_path(post)
    end
    @post = Post.find(params[:post_id])
    @report = Report.new
  end

  def create
    post = Post.find(params[:post_id])
    unless post.user_id != current_user.id
      redirect_to post_path(post)
    end
    @post = Post.find(params[:post_id])
    @report = Report.new(report_params)
    @report.post_id = @post.id
    if @report.save
      flash[:notice] = "通報しました。"
      redirect_to post_complete_path
    else
      @post = Post.find(params[:post_id])
      @report = Report.new(report_params)
      @report.post_id = @post.id
      flash[:alert] = "通報できませんでした。"
      render :new
    end
  end

  def complete
  end

  private

  def report_params
    params.require(:report).permit(:post_id, :reason, :body)
  end
end
