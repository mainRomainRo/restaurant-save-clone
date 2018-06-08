# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.delete_all

article_description = [
  "TOMATE, AIL, ORIGAN, BASILIC, ROQUETTE (+ COPPA 3,5-)",
  "TOMATE, MOZZA, BASILIC (+ COPPA 3.5-)",
  "AL RAGÙ new !",
  "PROVENÇALE",
  "BRIE",
  "4 FROMAGES",
  "FUNGHI",
  "BUFALA",
  "POLPETTONE",
  "PATON CRU "
]

article_title = [
  "MARINARA VEGAN !",
  "MARGHERITA",
  "TOMATE, FOIE DE VOLAILLE, PARMESAN, BASILIC",
  "TOMATE, OLIVE, ANCHOIS, ROQUETTE, CITRON",
  "BRIE, GRAINES, SALADE",
  "TOMATE, BLEU, TALEGGIO, PARMESAN, MOZZA",
  "TOMATE, CHAMPIGNONS, MOZZARELLA, PARMESAN, ORIGAN",
  "TOMATE, MOZZA di BUFALA, SALADE, BASILIC (+COPPA 3.5-)",
  "TOMATE, HACHÉ de veau, PARMESAN, BASILIC",
  ""
]

article_price = [
  8,
  9,
  9,5,
  9,5,
  12,
  13,5,
  13,5,
  14,
  15,
  3,5
]

i = 0

#cat_title.shuffle!
#cat_description.shuffle!


10.times do
  item = Item.new
  item.title = "#{article_title[i]}"
  item.description = "#{article_description[i]}!"
  item.price = article_price[i]
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
