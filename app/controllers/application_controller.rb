#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  private

     def current_cart 
       cart = Cart.find(session[:cart_id])
       rescue ActiveRecord::RecordNotFound
      cart = Cart.create
       session[:cart_id] = cart.id
       cart
    end

    # def current_cart
    #   if session[:user].present? && session[:user][:cart_id].present?
    #     return Cart.find(session[:user][:cart_id])
    #   else
    #     cart = Cart.create
    #     session[:user][:cart_id] = cart.id
    #     return cart
    #   end
    # end

    #def current_cart
      #user = User.find(session[:user_id])
     # user.cart.present? ? user.cart : user.cart.create
    #end

    #def current_user
      #User.find(session[:user_id])
    #end

    # ...

  protected

    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end
end
