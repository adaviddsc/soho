class Self < ActiveRecord::Base
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
  mount_uploader :bgimg, BgimgUploader
end
