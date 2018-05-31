# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.delete_all

cat_description = [
  "Friskies",
  "Monroe",
  "Zboubi",
  "Mistigri",
  "Minette",
  "Fripouille",
  "Nala",
  "Nina",
  "Jade",
  "Sheba",
  "Del Peyrat",
  "Félix",
  "Charles",
  "Pimprenelle",
  "Bic",
  "Dior",
  "Pépite",
  "Velour",
  "Groseille",
  "Raspberry"
]

cat_title = [
  "malow",
  "piteau",
  "grin",
  "teau fort",
  "peau-de-paille",
  "rlemagne",
  "meau",
  "rrue",
  "ssis",
  "sse-d'eau",
  "kira",
  "ka-ponk",
  "kal",
  "ça-court",
  "bal",
  "nel",
  "alors!",
  "gasse",
  "pelure",
  "ffouin"
]

i = 0

cat_title.shuffle!
cat_description.shuffle!

20.times do
  item = Item.new
  item.title = "Chat-#{cat_title[i]}"
  item.description = "Sous son brave petit prénom : #{cat_description[i]}!"
  item.price = rand(1..20)
  item.save
  i += 1
end

Item.all.each do |item|
    puts "---------------------------------"
    puts item.id
    puts item.title
    puts item.description
    puts item.price
    puts item.image_url
end
