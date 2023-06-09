class Admin::RegionsController < ApplicationController
  
  def destroy
    @region = Region.find(params[:id])
    @region.destroy
    redirect_to admin_posts_path
  end
  
end
