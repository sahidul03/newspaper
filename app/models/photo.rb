class Photo < ActiveRecord::Base
  mount_uploader :image, GalleryImageUploader
  belongs_to :gallery
end
