class Bid < ActiveRecord::Base
  belongs_to :product
  validates :value, :name, :email, presence: true
end
