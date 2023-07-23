class Admin::HomesController < ApplicationController
  
  def top
    @reports = Report.order(created_at: :desc).page(params[:page]).per(20)
  end
end
