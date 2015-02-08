class Ability < ActiveRecord::Base
  belongs_to :user
  has_many :ability_imgs
  has_many :ability_browses
  accepts_nested_attributes_for :ability_imgs, allow_destroy: true
end
