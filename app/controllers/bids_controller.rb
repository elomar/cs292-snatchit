class BidsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @bid = @product.build_bid(current_bidder)
  end

  def create
    @bid = Product.find(params[:product_id]).bids.create(bid_params)

    if @bid.save
      save_current_bidder params

      Notifier.new_bid(@bid).deliver
      Notifier.product_snatched(@bid.previous).deliver if @bid.previous.present? && @bid.email != @bid.previous.email

      redirect_to sale_products_path(@bid.product.sale), notice: "Congratulations, you snatched it - for now!"
    else
      redirect_to sale_products_path(@bid.product.sale), alert: "Ops, we couldn't let you snatch this one! Check your info."
    end
  end

  protected

  def bid_params
    params[:bid].merge!(current_bidder)
    params.require(:bid).permit(:value, :name, :email)
  end

  def save_current_bidder(params)
    cookies[:current_bidder_name] = params[:bid][:name]
    cookies[:current_bidder_email] = params[:bid][:email]
  end
end
