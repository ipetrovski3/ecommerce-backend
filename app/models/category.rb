class Category < ApplicationRecord

  mount_uploader :image, ImageUploader

  has_many :products, dependent: :destroy

end
