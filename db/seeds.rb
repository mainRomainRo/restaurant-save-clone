# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


cat_title = [
  "Lecpy",
  "Lanry",
  "Kekin",
  "Soul",
  "Fulyscar",
  "Neeight",
  "Windbolt",
  "Belturqgar",
  "Sleanlai",
  "Sizu",
  "Wrymcal",
  "Geldar",
  "Silsud",
  "Rumkon",
  "Zzriten",
  "Clesmaug",
  "Bolmoth",
  "Syllborya",
  "Frikiss",
  "Rasrepy"
]

cat_image = [
  "cat1.png",
  "cat2.png",
  "cat3.png",
  "cat4.png",
  "cat5.png",
  "cat6.png",
  "cat7.png",
  "cat8.png",
  "cat9.png",
  "cat10.png",
  "cat11.png",
  "cat12.png",
  "cat13.png",
  "cat14.png",
  "cat15.png",
  "cat16.png",
  "cat17.png",
  "cat18.png",
  "cat19.png",
  "cat20.png"
]

cat_description = [
"Halfsheepbush",
"Autumn-full",
"Furyeyes",
"Eaglehiltcyan",
"Locke-cat",
"Flameglidewalk",
"Jaw-paladin",
"Gatespringboarforge",
"Lynxshortshield",
"Wolfblackmoose",
"Bushbullsheep",
"Plainssheepdwarf",
"Warblade",
"Forgewalkred",
"Tree-morningore",
"Leaf-shine",
"Greybronze",
"Shieldlanderautumn",
"Wartalldwarf",
"Brightroadmagenta"
]

i = 0

cat_title.shuffle!
cat_image.shuffle!
cat_description.shuffle!

Item.populate(20) do |item|
  item.title = "#{cat_name[i]}'s photo"
  item.description = "From #{cat_description[i]}'s family"
  item.price = rand(100..2000)
  item.image_url = cat_image[i]
  i++
end
