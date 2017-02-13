# class calculate tax and price
class Calculation
	class << self
		def calculate_price(item)
			item.quantity() * item.price()
		end

		def calculate_tax(item)
			round_tax(item)
		end

		def round_tax(item)
			nearest_cent = 1 / Constants::ROUNDING_TO_THE_NEAREST_FACTOR
			item.tax = (nearest_cent * base_tax(item)).ceil / nearest_cent
		end

		# calculate tax for each item
		def base_tax(item)
			if item.imported? && !item.exempt? then
				item.quantity() * item.price() * Constants::BOTH
			elsif item.imported? && item.exempt? then
				item.quantity() * item.price() * Constants::IMPORT_TAX_RATE
			elsif !item.imported? && !item.exempt? then				
				item.quantity() * item.price() * Constants::SALES_TAX_RATE
			else 
				0
			end
		end

	end
end
