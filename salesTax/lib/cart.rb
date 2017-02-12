class Cart
	attr_accessor :items, :total_price, :total_tax
	def initialize()
		@items = Array.new
	end

	def add(item)
		@items.push(item)
	end
end
