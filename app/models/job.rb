class Job < ActiveRecord::Base
  belongs_to :user
  has_many :job_imgs
  has_many :job_browses
  accepts_nested_attributes_for :job_imgs, allow_destroy: true
end
