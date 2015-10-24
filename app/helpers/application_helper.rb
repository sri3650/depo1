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
  def count(product_id)
  	 var=Review.where("product_id="+product_id.to_s)
     var.count
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
  def added_wishlist(product_id,user_id)
  	var3= Wishlist.where("product_id="+product_id.to_s+" and user_id="+user_id.to_s)[0] 
  	if(var3.nil?)
  		return true
  	else
  		return false
    end
  end 		
  def adm()
    	var2=User.where("id="+current_user.to_s)[0]
    	if(var2.nil?)
    		return false

    	elsif(var2.name=='admin')
    	  return true;
    	  else
    	  return false
    	  end
    	
  end
  def psname(product_id)
  	var4= Product.where("id="+product_id.to_s)[0]
  	
  end	
end