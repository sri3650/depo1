class Review < ActiveRecord::Base
  RATE_TYPES=["1","2","3","4","5"]
  belongs_to :user
  belongs_to :product
  attr_accessible :user_id, :product_id, :rating
end
