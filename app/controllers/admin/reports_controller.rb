class Admin::ReportsController < ApplicationController

  def show
    @report = Report.find(params[:id])
  end

  def update
    report = Report.find(params[:id])
    if report.update(report_params)
      flash[:notice] = "対応ステータスを更新しました。"
      redirect_to admin_root_path
    else
      @report = Report.find(params[:id])
      flash[:alert] = "ステータスの更新に失敗しました。"
      render :show
    end
  end

  private

  def report_params
    params.require(:report).permit(:is_handled)
  end

end
