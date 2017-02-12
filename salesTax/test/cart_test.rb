require './lib/cart.rb'
require './lib/item.rb'

# test class Cart.rb
class CartTest
	
	RSpec.describe Cart do
		before :all do
			# input string
			@item1 = Item.new(1,"imported box of chocolates",10.00)
			@item2 = Item.new(1,"imported bottle of perfume",47.50)			
			@total_price = 65.15
			@total_tax = 7.65
			@cart = Cart.new
		end

		context "cart_test" do
			#TC1 add to cart
			it "add to cart" do
				@cart.add(@item1)
				@cart.add(@item2)

				expect(@cart.items).to eq([@item1, @item2])
			end

			#TC2
			it "set total price" do
				@cart.total_price = 65.15
				expect(@cart.total_price).to eq(@total_price)
			end

			#TC3
			it "set total tax" do
				@cart.total_tax = 7.65
				expect(@cart.total_tax).to eq(@total_tax)
			end

			#TC4
			it "set cart items" do
				@cart.items = [@item1, @item2]
				expect(@cart.items).to eq([@item1, @item2])
			end			

		end

	end
end
