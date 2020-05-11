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

bread = Category.create(name: "Bread")
pasta = Category.create(name: "Pasta")
milk = Category.create(name: "Milk")
dairy = Category.create(name: "Dairy")
eggs = Category.create(name: "Eggs")
toilet_roll = Category.create(name: "Toilet roll")
_fruit = Category.create(name: "Fruit")
vegetables = Category.create(name: "Vegetables")
meat = Category.create(name: "Vegetables")

Grocery.create(name: "Spaghetti", category: pasta)
Grocery.create(name: "Penne", category: pasta)
Grocery.create(name: "Fusilli", category: pasta)
Grocery.create(name: "Farfalle", category: pasta)

Grocery.create(name: "White bread", category: bread)
Grocery.create(name: "Whitte pitta bread", category: bread)
Grocery.create(name: "Brown Pitta bread", category: bread)
Grocery.create(name: "Brown bread", category: bread)
Grocery.create(name: "Wholemeal bread", category: bread)
Grocery.create(name: "Bread rolls", category: bread)
Grocery.create(name: "Gluten free bread", category: bread)

Grocery.create(name: "Dairy free", category: milk)
Grocery.create(name: "Whole milk", category: milk)
Grocery.create(name: "Skimmed milk", category: milk)
Grocery.create(name: "Semi-skimmed milk", category: milk)

Grocery.create(name: "Cheddar", category: dairy)
Grocery.create(name: "Cheese slices", category: dairy)
Grocery.create(name: "Cream cheese", category: dairy)
Grocery.create(name: "Double cream", category: dairy)
Grocery.create(name: "Mozzarella", category: dairy)
Grocery.create(name: "Feta", category: dairy)

Grocery.create(name: "6 eggs", category: eggs)
Grocery.create(name: "12 eggs", category: eggs)
Grocery.create(name: "Organic eggs", category: eggs)
Grocery.create(name: "Free range eggs", category: eggs)

Grocery.create(name: "2 rolls", category: toilet_roll)
Grocery.create(name: "4 rolls", category: toilet_roll)
Grocery.create(name: "6 rolls", category: toilet_roll)
Grocery.create(name: "12 rolls", category: toilet_roll)

Grocery.create(name: "Tomatoes", category: vegetables)
Grocery.create(name: "Courgette", category: vegetables)
Grocery.create(name: "Potatoes", category: vegetables)
Grocery.create(name: "Carrots", category: vegetables)
Grocery.create(name: "Mushrooms", category: vegetables)
Grocery.create(name: "Onions", category: vegetables)
Grocery.create(name: "Garlic", category: vegetables)
Grocery.create(name: "Broccoli", category: vegetables)

Grocery.create(name: "Chicken breast", category: meat)
Grocery.create(name: "Beef", category: meat)
Grocery.create(name: "Sausages", category: meat)
Grocery.create(name: "Ham", category: meat)
Grocery.create(name: "Lamb", category: meat)
