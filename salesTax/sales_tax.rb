require './lib/cart.rb'
require './lib/input.rb'
require './lib/item.rb'
require './lib/calculation.rb'
require './lib/receipt.rb'

file_name = ARGV[0]
total_price = 0
total_tax = 0
cart = Cart.new

#create the item objects and add them to cart
  File.open(file_name, "r") do |infile|
      while (line = infile.gets)
           hash_obj = Input.parseString(line)
           item = Item.new(hash_obj[:quantity],hash_obj[:name],hash_obj[:price])
           cart.add(item)
       end
       
       cart.items().each do |item|
          total_price += Calculation.calculate_price(item)
          total_tax += Calculation.calculate_tax(item)
       end
       #set total price for cart
       cart.total_price = total_price
       #set total tax for cart
       cart.total_tax = total_tax
       receipt = Receipt.new(cart)
       #output
       receipt.print()

 end
 
 
