class LastRightSideAd < ActiveRecord::Base
  mount_uploader :ad_picture, LastRightSideAdUploader

  validates :ad_picture, presence: true
end
