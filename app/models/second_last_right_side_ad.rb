class SecondLastRightSideAd < ActiveRecord::Base
  mount_uploader :ad_picture, SecondLastRightSideAdUploader

  validates :ad_picture, presence: true

end
