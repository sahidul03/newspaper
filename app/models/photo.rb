class Photo < ActiveRecord::Base
  validates :image, presence: true
  mount_uploader :image, GalleryImageUploader
  belongs_to :gallery
end
