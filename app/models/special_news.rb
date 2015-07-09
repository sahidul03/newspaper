class SpecialNews < ActiveRecord::Base
  validates :post_id, presence: true
  validates :post_id, uniqueness: true
  belongs_to :post
end
