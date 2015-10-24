class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  def current_user
    session[:user_id]
  end

  private

  def current_cart 
     cart = Cart.find(session[:cart_id])
     rescue ActiveRecord::RecordNotFound
    cart = Cart.create
     session[:cart_id] = cart.id
     cart
  end
  
  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end
  def authorize_admin
    if(session[:user_id])
      var= User.find_by_id(session[:user_id])[0]
      if(var.nil?)
        redirect_to login_url
      else
        
        unless var.name=='admin'
          redirect_to store_url
        end
      end  
    end
  end
end