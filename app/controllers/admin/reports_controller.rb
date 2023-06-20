class Admin::ReportsController < ApplicationController

  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end

  def update
    report = Report.find(params[:id])
    report.update(report_params)
    flash[:notice] = "対応ステータスを更新しました。"
    redirect_to admin_reports_path
  end

  private

  def report_params
    params.require(:report).permit(:is_handled)
  end

end
