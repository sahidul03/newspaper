class Post < ActiveRecord::Base

  validates :title, :content, :category_id, presence: true
  mount_uploader :photo, PostImageUploader

  belongs_to :category
  belongs_to :division
  has_one :headline
  has_one :special_news
  has_one :slider_news
end
