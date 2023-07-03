class Public::ReportsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @post = Post.find(params[:post_id])
    @report = Report.new
  end
  
  def create
    @post = Post.find(params[:post_id])
    @report = Report.new(report_params)
    @report.post_id = @post.id
    if @report.save
      redirect_to post_complete_path
    else
      @post = Post.find(params[:post_id])
      render :new, alert: "通報できませんでした。"
    end
  end
  
  def complete
  end
  
  private
  
  def report_params
    params.require(:report).permit(:post_id, :reason, :body)
  end
end
