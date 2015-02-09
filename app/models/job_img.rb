class JobImg < ActiveRecord::Base
  belongs_to :job
  mount_uploader :image, AvatarUploader
end
