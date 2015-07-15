class NewsProperty < ActiveRecord::Base

  mount_uploader :logo, LogoUploader
  mount_uploader :febicon, FebiconUploader

end
