# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
TimeSlot.create(code: '1', name: 'Morning');
TimeSlot.create(code: '2', name: 'Afternoon');
TimeSlot.create(code: '3', name: 'Evening');
TimeSlot.create(code: '4', name: 'All-Day');
