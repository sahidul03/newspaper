class Post < ActiveRecord::Base

  validates :title, :content, :category_id, presence: true
  mount_uploader :photo, PostImageUploader

  belongs_to :category
  belongs_to :division
  has_one :headline, :dependent => :destroy
  has_one :special_news, :dependent => :destroy
  has_one :slider_news, :dependent => :destroy
end
