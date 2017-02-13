require './app/models/cart.rb'
require './app/models/item.rb'
require './app/controllers/calculation.rb'

# test class Calculation.rb
class CalculationTest
	
	RSpec.describe Calculation do
		before :all do
			@imported_item = Item.new(1,"imported box of chocolates",10.00)
			@imported_nonexcempt_item = Item.new(1,"imported bottle of perfume",27.99)
			@excempt_item = Item.new(1,"packet of headache pills",9.75)
			@nonexcempt_item = Item.new(1,"bottle of perfume",18.99)
		end

		context "test_calculation_price" do
			#TC1
			it "calculate total price" do
				expect(Calculation.calculate_price(@imported_nonexcempt_item)).to eq(27.99)
			end

		end

		context "test_base_tax" do
			#TC2
			it "tax_for_imported_product" do
				expect(Calculation.base_tax(@imported_item).round(2)).to eq(0.5)
			end

			#TC3
			it "tax_for_non_exempt_product" do
				expect(Calculation.base_tax(@nonexcempt_item).round(2)).to eq(1.9)
			end

			#TC4
			it "tax_for_nonexempt_&_imported_product" do
				expect(Calculation.base_tax(@imported_nonexcempt_item).round(2)).to eq(4.2)
			end

			#TC5
			it "tax_for_exempt_product" do
				expect(Calculation.base_tax(@excempt_item)).to eq(0)
			end

		end

		context "test_round_tax" do
			#TC6
			it "round tax" do
				expect(Calculation.round_tax(@imported_nonexcempt_item)).to eq(4.2)
				expect(Calculation.round_tax(@nonexcempt_item)).to eq(1.9)
				expect(Calculation.round_tax(@imported_item)).to eq(0.5)
				expect(Calculation.round_tax(@excempt_item)).to eq(0)
			end
		end

	end
end
