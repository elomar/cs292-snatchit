class Product < ActiveRecord::Base
  belongs_to :sale
  has_many :bids, after_add: :update_current_value
  validates_presence_of :title
  mount_uploader :picture, PictureUploader

  default_scope order("updated_at desc")

  def build_bid(params)
    bids.build params.merge(value: next_value)
  end

  def to_s
    title
  end

  protected

  def update_current_value(_bid)
    update_column :current_value, bids.maximum("value") || current_value
  end

  def next_value
    current_value + current_value/10 + 1
  end
end
