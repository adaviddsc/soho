class AbilityImg < ActiveRecord::Base
  belongs_to :ability
  mount_uploader :image, AvatarUploader
end
