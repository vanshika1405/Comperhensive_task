class InventoryItem
    @@inventory = []  # Class variable to store inventory items
  
    attr_accessor :name, :category, :quantity, :price   #getter and setter methods 
  
    def initialize(name, category, quantity, price)
      @name = name
      @category = category
      @quantity = quantity
      @price = price
      @@inventory << self  # Add the instance to the class variable
    end
  
    def display_details
      puts "Name: #{name}\n Category: #{category} \n Quantity: #{quantity} \n Price: #{price}" # string interpolation 
    end
  
    def to_hash
      { name: name, category: category, quantity: quantity, price: price } #conversion into hash
    end
  
    def check_stock
      if quantity < 10
        puts "Low stock, order more."
      else
        puts "In stock."
      end
    end
  
    def self.calculate_total_value
      total_value = @@inventory.sum { |item| item.quantity * item.price }
      puts "Total Inventory Value: $#{total_value}"
    end
  
    def self.inventory
      @@inventory
    end
  end
  
  class DiscountedItem < InventoryItem
    attr_accessor :discount_percentage
  
    def initialize(name, category, quantity, price, discount_percentage)
      super(name, category, quantity, price)
      @discount_percentage = discount_percentage
    end
  
    def display_details
      discounted_price = @price - (@price * @discount_percentage / 100.0)
      puts "Name: #{@name}, Category: #{@category}, Quantity: #{@quantity}, Price: $#{@price}, Discounted Price: $#{discounted_price}"
    end
  end
  
                                                                        # Create instances of InventoryItem
  item1 = InventoryItem.new("Fan", "Electronics", 20, 800)
  item2 = InventoryItem.new("pen", "Stationery", 5, 15)
  item3 = InventoryItem.new("Lehengas", "Fashion", 8, 50)
  
                                                                          # Display details of each item in the inventory
  InventoryItem.inventory.each { |item| item.display_details }
  
  # Convert each item to hash and print details
  InventoryItem.inventory.each { |item| puts item.to_hash }
  
  # Check stock for each item
  InventoryItem.inventory.each { |item| item.check_stock }
  
  # User interaction 
  puts "Enter details for a new item:"
  print "Name: "
  new_name = gets.chomp
  print "Category: "
  new_category = gets.chomp
  print "Quantity: "
  new_quantity = gets.to_i
  print "Price: "
  new_price = gets.to_f
  
  # Create a new InventoryItem instance with user-provided 
  new_item = InventoryItem.new(new_name, new_category, new_quantity, new_price)
  
  # instance of DiscountedItem
  discounted_item = DiscountedItem.new("Smartphone", "Electronics", 15, 500, 10)
  discounted_item.display_details
  
  # Calculate and print the total value of the inventory
  InventoryItem.calculate_total_value
  