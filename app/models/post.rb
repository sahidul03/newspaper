class Post < ActiveRecord::Base

  validates :title, :content, :category_id, presence: true
  mount_uploader :photo, PostImageUploader

  belongs_to :category
end
