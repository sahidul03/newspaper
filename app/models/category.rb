class Category < ActiveRecord::Base
  validates :name, presence: true
  has_many :posts, dependent: :destroy

  has_one :left_category_news, dependent: :destroy
  has_one :right_category_news, dependent: :destroy
  has_one :bottom_category_news, dependent: :destroy
end
