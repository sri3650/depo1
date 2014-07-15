class AddRatingToProducts < ActiveRecord::Migration
  def change
    add_column :products, :rating, :decimal, :default=>0
  end
end
