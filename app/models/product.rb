class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :category

  has_many :orders
end
