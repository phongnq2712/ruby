require './app/helpers/input.rb'

# test module Input
class InputTest
	
	RSpec.describe Input do
		before :all do
			# input string 
			@str = "1, book, 12.49"
			@str_null = ""
		end

		context "parse" do
			#TC1
			it "input string to hash" do
				result = {}
				result[:quantity] = "1"
				result[:name] = "book"
				result[:price] = "12.49"

				expect(Input.parseString(@str)).to eq(result)
			end

			#TC2
			it "input string is null" do
				result_null = {} 
				expect(Input.parseString(@str_null)).to eq(result_null)
			end

		end

	end
end
