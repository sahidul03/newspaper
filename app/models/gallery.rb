class Gallery < ActiveRecord::Base
  validates :title, presence: true
  has_many :photos, dependent: :destroy
end
