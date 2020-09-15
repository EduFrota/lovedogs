class Image < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :dog

  validates :image, presence: true
end
