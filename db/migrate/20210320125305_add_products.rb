class AddProducts < ActiveRecord::Migration[6.1]
  def change
  	Product.create :title => 'Hawaiian', :description => 'This is Hawaiian pizza', :price => 350, :size => 30, :is_spicy => false, :is_veg => true, :is_best_offer => false, :path_to_image => '/images/hawaii.jpg'

  	Product.create :title => 'Papperoni', :description => 'This is Papperoni pizza', :price => 450, :size => 30, :is_spicy => false, :is_veg => false, :is_best_offer => false, :path_to_image => '/images/papperoni.jpg'

  	Product.create :title => 'Margarita', :description => 'This is Margarita pizza', :price => 400, :size => 30, :is_spicy => true, :is_veg => false, :is_best_offer => true, :path_to_image => '/images/margarita.jpg'
  end
end
