class HeaderBottomAd < ActiveRecord::Base
  mount_uploader :ad_picture, HeaderBottomAdUploader

  validates :ad_picture, presence: true

end
