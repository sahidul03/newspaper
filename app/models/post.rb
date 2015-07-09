class Post < ActiveRecord::Base

  validates :title, :content, :category_id, presence: true
  mount_uploader :photo, PostImageUploader

  belongs_to :category
  belongs_to :division
  has_one :headline, dependent: destroy
end
