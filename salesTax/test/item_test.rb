require './lib/cart.rb'
require './lib/item.rb'
require './lib/constants.rb'
require 'yaml'

# test class Item.rb
class ItemTest
	
	RSpec.describe Item do
		before :all do
			# input string
			@item = Item.new(1,"imported box of chocolates",10.00)
			@name = "imported box of chocolates"
			@price = 10.00
			@quantity = 1
			@tax = 10.50
			@exemption ||= YAML.load File.open(Constants::EXAMPTION_ITEMS)
			@exemption_null ||= YAML.load File.open('./test/examption_items.yml')
		end

		context "load yaml file" do
			#TC1
			it "file is not null" do
				expect(@exemption).to eq(['chocolate', 'book','headache'])
			end	

			#TC2
			it "file is null" do
				expect(@exemption_null).to eq(false)
			end

		end

		context "tax_exempt?" do
			#TC3
			it "item is exempt" do
				expect(@item.exempt?).to eq true	
			end

			#TC4
			it "item is not exempt" do
				@item.name = "imported box of perfume"
				expect(@item.exempt?).to eq false			
			end
		end

		context "tax_imported?" do
			#TC5
			it "item is imported" do
				@item.name = "imported box of perfume"
				expect(@item.imported?).to eq true	
			end

			#TC6
			it "item is not imported" do
				@item.name = "box of perfume"
				expect(@item.imported?).to eq false			
			end
		end

		context "tax" do
			#TC7
			it "tax_test" do
				@item.tax = @tax
				expect(@item.tax).to eq(@tax)
			end

		end

	end
end
