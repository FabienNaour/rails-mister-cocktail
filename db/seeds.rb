# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "--------------------"
puts '1/3 Cleaning database cocktail...'
Cocktail.destroy_all
puts 'Creating cocktails...'

cock1 = Cocktail.create(name: "Mojito")
cock2 = Cocktail.create(name: "Americano")

puts '1/3 Finished! Cocktails'

puts "--------------------"
puts '2/3 Cleaning database ingredient...'
Ingredient.destroy_all
puts 'Creating ingredient...'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

jason = open(url).read
parse = JSON.parse(jason)

ingredients = parse["drinks"]

ingredients.each do |ingredient|
 Ingredient.create(name: ingredient['strIngredient1'])
end

# {
# "drinks": [
# {
# "strIngredient1": "Light rum"
# },


ing1 = Ingredient.create(name: "lemon")
ing2 = Ingredient.create(name: "ice")

Ingredient.create(name: "mint leaves")
puts '2/3 Finished! Ingredients'

puts "--------------------"

puts '3/3 Cleaning database doses...'
Dose.destroy_all


puts 'Creating doses...'


d1 = Dose.create(
  description: "2cl",
  cocktail: cock1,
  ingredient: ing1
  )

d2 = Dose.create(
  description: "4cl",
  cocktail: cock2,
  ingredient: ing2
  )


puts '3/3 Finished! Doses'
