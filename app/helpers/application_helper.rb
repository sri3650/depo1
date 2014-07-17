#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end
  def current_user
    session[:user_id]
  end

  def avg_rating(product_id)
  	Review.where("product_id="+product_id.to_s).average("rating").to_f
  end
  def given_review(product_id,user_id)
  	
  	var=Review.where("product_id="+product_id.to_s + " and user_id="+user_id.to_s)[0]
  	if(var.nil?)
  		return true
  	end
    var=var.rating		
  	if var==0
  		return true;
  	else 
  		return false;
  	end
  end
end
