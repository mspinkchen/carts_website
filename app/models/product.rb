class Product < ApplicationRecord
  validates_presence_of :name
  mount_uploader :image, ProductUploader
end
