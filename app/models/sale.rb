class Sale < ActiveRecord::Base
  belongs_to :user
  has_many :products

  def winning_bids
    products.map(&:winning_bid).compact
  end
end
