class Public::ReportsController < ApplicationController
  def new
    @report = Report.new
  end
  
  def create
  end
  
  def complete
  end
  
  private
  
  def report_params
    params.require(:report).permit(:post_id, :reason, :body, :is_handled)
  end
end
