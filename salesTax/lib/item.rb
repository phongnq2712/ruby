require './lib/constants'
require 'yaml'

class Item
  	attr_accessor :quantity, :price, :name, :tax
  	def initialize(quantity,name,price)
	    @quantity = quantity.to_i
	    @name = name.to_s
	    @price = price.to_f
  	end

  	def imported?
  		@name.include?("imported")
  	end

  	def exempt?
  		exemptions.any? {|exemptions| @name.include?(exemptions)}
  	end

    #list excemption items 
  	def exemptions
  		exemptions ||= YAML.load File.open(Constants::EXAMPTION_ITEMS)
  	end

end