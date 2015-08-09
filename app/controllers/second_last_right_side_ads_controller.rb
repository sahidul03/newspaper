class SecondLastRightSideAdsController < ApplicationController
  def index
    @second_last_right_ads=SecondLastRightSideAd.all
    @slr_ad=SecondLastRightSideAd.new
    render layout: 'admin_layout'
  end

  def create
    if params[:second_last_right_side_ad]
      @slr_ad=SecondLastRightSideAd.new(params_second_last_right_ad)
      if @slr_ad.save
        flash[:notice] = "Second Last Right Side Ad added successfully."
      else
        flash[:alert] = "Please select a valid image (jpg jpeg gif png)"
      end
      redirect_to second_last_right_side_ads_path
    else
      flash[:alert] = "Image can't be blank"
      redirect_to second_last_right_side_ads_path
    end

  end

  def destroy
    @slr_ad=SecondLastRightSideAd.find(params[:id])
    if @slr_ad.destroy
      flash[:notice] = "Second Last Right Side Ad deleted successfully."
      redirect_to second_last_right_side_ads_path
    end
  end
  private
  def params_second_last_right_ad
    params.require(:second_last_right_side_ad).permit(:ad_picture,:link);
  end

end
