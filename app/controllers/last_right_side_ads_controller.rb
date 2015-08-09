class LastRightSideAdsController < ApplicationController

  def index
    @last_right_ads=LastRightSideAd.all
    @lr_ad=LastRightSideAd.new
    render layout: 'admin_layout'
  end

  def create
    if params[:last_right_side_ad]
      @lr_ad=LastRightSideAd.new(params_last_right_side_ad)
      if @lr_ad.save
        flash[:notice] = "Last Right Side Ad added successfully."
      else
        flash[:alert] = "Please select a valid image (jpg jpeg gif png)"
      end
      redirect_to last_right_side_ads_path
    else
    flash[:alert] = "Image can't be blank"
    redirect_to last_right_side_ads_path
    end
  end

  def destroy
    @lr_ad=LastRightSideAd.find(params[:id])
    if @lr_ad.destroy
      flash[:notice] = "Last Right Side Ad deleted successfully."
      redirect_to last_right_side_ads_path
    end
  end
  private
  def params_last_right_side_ad
    params.require(:last_right_side_ad).permit(:ad_picture,:link);
  end
end
