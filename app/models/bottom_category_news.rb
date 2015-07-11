class BottomCategoryNews < ActiveRecord::Base
  validates :category_id, presence: true
  validates :category_id, uniqueness: true
  belongs_to :category
end
