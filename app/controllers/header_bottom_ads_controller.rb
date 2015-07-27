class HeaderBottomAdsController < ApplicationController

  def index
    @header_footer_ads=HeaderBottomAd.all
    @hf_ad=HeaderBottomAd.new
    render layout: 'admin_layout'
  end

  def create
    if params[:header_bottom_ad]
      @hf_ad=HeaderBottomAd.new(params_header_bottom_ad)
      if @hf_ad.save
        flash[:notice] = "Header Bottom Ad added successfully."
      else
        flash[:alert] = "Please select a valid image (jpg jpeg gif png)"
      end
      redirect_to header_bottom_ads_path
    else
      flash[:alert] = "Image can't be blank"
      redirect_to header_bottom_ads_path
    end
  end

  def destroy
    @hf_ad=HeaderBottomAd.find(params[:id])
    if @hf_ad.destroy
      flash[:notice] = "Header Bottom Ad deleted successfully."
      redirect_to header_bottom_ads_path
    end
  end
  private
  def params_header_bottom_ad
    params.require(:header_bottom_ad).permit(:ad_picture);
  end

end
