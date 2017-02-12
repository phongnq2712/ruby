module Input
	# parse string to hash object
	def self.parseString(str)
		result = {}
		
		unless str.to_s.empty?
			values = str.split(",")
			result[:quantity] = values[0].strip if !values[0].to_s.empty?
			result[:name] = values[1].strip if !values[1].to_s.empty?
			result[:price] = values[2].strip if !values[2].to_s.empty?	
		end

		return result
	end
end