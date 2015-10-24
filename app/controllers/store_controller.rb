class StoreController < ApplicationController
  skip_before_filter :authorize
  skip_before_filter :autorize_admin
  def index
    @products = Product.order(:title)
    @cart = current_cart
  end
end
