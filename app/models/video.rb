class Video < ActiveRecord::Base
  validates :url, presence: true
end
