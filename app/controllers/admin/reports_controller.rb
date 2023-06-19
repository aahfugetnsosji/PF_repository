class Admin::ReportsController < ApplicationController
  
  def index
  end
  
  def show
  end
  
  def update
  end
  
  private
  
  def report_params
    params.require(:report).permit(:is_handled)
  end
  
end
