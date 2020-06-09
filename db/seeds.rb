# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
TimeSlot.create(code: "1", name: "Morning")
TimeSlot.create(code: "2", name: "Afternoon")
TimeSlot.create(code: "3", name: "Evening")
TimeSlot.create(code: "4", name: "All-Day")

      bread = Category.create(name: "Bakery")
      pasta = Category.create(name: "Pasta and Rice")
      milk = Category.create(name: "Milk nad Butter")
      cheese = Category.create(name: "Cheese")
      eggs = Category.create(name: "Eggs")
      household = Category.create(name: "Household items")
      fruit = Category.create(name: "Fresh fruit")
      vegetables = Category.create(name: "Fresh Vegetables")
      meat = Category.create(name: "Fresh Meat")
      pharmacy = Category.create(name: "Pharmacy")

Grocery.create(name: "Sliced white bread", category: bread)
Grocery.create(name: "Sliced brown bread", category: bread)
Grocery.create(name: "Sliced multigrain bread", category: bread)
Grocery.create(name: "White pitta bread", category: bread)
Grocery.create(name: "Wholegrain pitta bread", category: bread)
Grocery.create(name: "Glutten free sliced bread", category: bread)
Grocery.create(name: "Bread rolls", category: bread)
Grocery.create(name: "Glutten free bread rolls", category: bread)

Grocery.create(name: "Dairy free milk", category: milk)
Grocery.create(name: "Sunflower spread", category: milk)
Grocery.create(name: "Whole fat milk", category: milk)
Grocery.create(name: "Semi-skimmed milk", category: milk)
Grocery.create(name: "Skimmed milk", category: milk)
Grocery.create(name: "Butter", category: milk)

Grocery.create(name: "6 Free range eggs", category: eggs)
Grocery.create(name: "6 Organic eggs", category: eggs)

Grocery.create(name: "Cheddar Block", category: cheese)
Grocery.create(name: "Mozzarella", category: cheese)
Grocery.create(name: "Feta", category: cheese)
Grocery.create(name: "Sliced cheddar", category: cheese)
Grocery.create(name: "Grated cheddar", category: cheese)
Grocery.create(name: "Dairy free Cheddar style block", category: cheese)
Grocery.create(name: "Dairy free slices", category: cheese)
Grocery.create(name: "Dairy free grated", category: cheese)

Grocery.create(name: "Potatoes", category: vegetables)
Grocery.create(name: "Onions", category: vegetables)
Grocery.create(name: "Carrots", category: vegetables)
Grocery.create(name: "Parsnips", category: vegetables)
Grocery.create(name: "Tomatoes", category: vegetables)
Grocery.create(name: "Mushrooms", category: vegetables)
Grocery.create(name: "Broccoli", category: vegetables)
Grocery.create(name: "Salad bag", category: vegetables)
Grocery.create(name: "Courgettes", category: vegetables)

Grocery.create(name: "Apples", category: fruit)
Grocery.create(name: "Bananas", category: fruit)
Grocery.create(name: "Oranges", category: fruit)

Grocery.create(name: "Wholewheat pasta", category: pasta)
Grocery.create(name: "Gluten free pasta", category: pasta)
Grocery.create(name: "Long grain rice", category: pasta)
Grocery.create(name: "Short grain rice", category: pasta)
Grocery.create(name: "Basmati rice", category: pasta)

Grocery.create(name: "Beef steaks", category: meat)
Grocery.create(name: "Beef burgers (pack of 2)", category: meat)
Grocery.create(name: "Beef chunks", category: meat)
Grocery.create(name: "Bacon (6 slices)", category: meat)
Grocery.create(name: "Pork sausages", category: meat)
Grocery.create(name: "Chicken breasts", category: meat)
Grocery.create(name: "Whole chicken", category: meat)
Grocery.create(name: "Lamb chunks", category: meat)

Grocery.create(name: "Toilet rolls (pack of 4)", category: household)

Grocery.create(name: "Paracetamol", category: pharmacy)
Grocery.create(name: "Prescription", category: pharmacy)
