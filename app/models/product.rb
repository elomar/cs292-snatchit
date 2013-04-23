class Product < ActiveRecord::Base
  belongs_to :sale

  validates_presence_of :title
end
