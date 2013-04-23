class Product < ActiveRecord::Base
  belongs_to :sale
  validates_presence_of :title
  mount_uploader :picture, PictureUploader
end
