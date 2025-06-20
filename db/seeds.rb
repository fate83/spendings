# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# categories = %w[Gemüse Belag Grundnahrungsmittel Gewürz Süsskram Obst Getränke Haushalt Körperpflege]
# categories.each do |category|
#   Category.create(name: category)
# end

# shops = [ "Rewe Solms", "Aldi Solms", "Rewe Center", "Rewe Braunfels", "Edeka Braunfels", "Amazon", "Globus Dutenhofen",
#           "Penny", "Lidl Mittelbiel", "Lidl Wetzlar" ]
# shops.each do |shop|
#   Shop.create(name: shop)
# end


data = [
  [ "26.03.2025", "Rewe Solms",          "Rispentomate 2,49/kg"      ,"1,97",  "Gemüse" ],
  [ "26.03.2025", "Rewe Solms",          "Geflügelmortadella"        ,"2,38",  "Belag" ],
  [ "26.03.2025", "Rewe Solms",          "Salatgurke"                ,"0,75",  "Gemüse" ],
  [ "26.03.2025", "Rewe Solms",          "Spaghetti No. 5"           ,"0,99",  "Grundnahrungsmittel" ],
  [ "26.03.2025", "Rewe Solms",          "RB ACETO Balsamico"        ,"2,49",  "Gewürz" ],
  [ "26.03.2025", "Rewe Solms",          "Leinöl"                    ,"2,99",  "Gewürz" ],
  [ "26.03.2025", "Aldi Solms",          "Bio Eier"                  ,"3,39",  "Grundnahrungsmittel" ],
  [ "26.03.2025", "Aldi Solms",          "Bio Eier"                  ,"3,39",  "Grundnahrungsmittel" ],
  [ "26.03.2025", "Aldi Solms",          "Knoppers XXL"              ,"2,79",  "Süsskram" ],
  [ "26.03.2025", "Aldi Solms",          "Knoppers XXL"              ,"2,79",  "Süsskram" ],
  [ "26.03.2025", "Aldi Solms",          "Kinder Bueno"              ,"3,99",  "Süsskram" ],
  [ "05.04.2025", "Rewe Center",         "Apfel Braeburn 2,99/kg"    ,"1,38",  "Obst" ],
  [ "05.04.2025", "Rewe Center",         "Gouda"                     ,"2,99",  "Belag" ],
  [ "05.04.2025", "Rewe Center",         "Zucchini Bio"              ,"1,99",  "Gemüse" ],
  [ "05.04.2025", "Rewe Center",         "Bio Eier"                  ,"4,99",  "Grundnahrungsmittel" ],
  [ "05.04.2025", "Rewe Center",         "Frosta"                    ,"2,49",  "Grundnahrungsmittel" ],
  [ "05.04.2025", "Rewe Center",         "Frosta"                    ,"2,49",  "Grundnahrungsmittel" ],
  [ "05.04.2025", "Rewe Center",         "Tortelloni Schinken"       ,"0,99",  "Grundnahrungsmittel" ],
  [ "05.04.2025", "Rewe Center",         "Nutella 2St."              ,"4,98",  "Belag" ],
  [ "05.04.2025", "Rewe Center",         "Popcorn Levy"              ,"2,99",  "Süsskram" ],
  [ "05.04.2025", "Rewe Center",         "Haribo Goldbär"            ,"1,19",  "Süsskram" ],
  [ "08.04.2025", "Rewe Braunfels",      "Geflügelmortadella"        ,"2,38",  "Belag" ],
  [ "08.04.2025", "Rewe Braunfels",      "Gouda"                     ,"2,99",  "Belag" ],
  [ "08.04.2025", "Rewe Braunfels",      "Wasser"                    ,"1,74",  "Getränke" ],
  [ "08.04.2025", "Edeka Braunfels",     "Kasten Bizzl"              ,"8,49",  "Getränke" ],
  [ "08.04.2025", "Edeka Braunfels",     "Kochschinken"              ,"2,98",  "Belag" ],
  [ "08.04.2025", "Edeka Braunfels",     "Knorr Fix"                 ,"1,98",  "Grundnahrungsmittel" ],
  [ "08.04.2025", "Edeka Braunfels",     "Iglo Schlemmerfilet"       ,"2,77",  "Grundnahrungsmittel" ],
  [ "08.04.2025", "Edeka Braunfels",     "Iglo Schlemmerfilet"       ,"2,77",  "Grundnahrungsmittel" ],
  [ "09.04.2025", "Amazon",              "Proteinpulver"             ,"24,49", "Grundnahrungsmittel" ],
  [ "09.04.2025", "Amazon",              "Proteinpulver"             ,"24,49", "Grundnahrungsmittel" ],
  [ "11.04.2025", "Rewe Braunfels",      "Brot"                      ,"1,99",  "Grundnahrungsmittel" ],
  [ "11.04.2025", "Rewe Braunfels",      "Bio Eier"                  ,"6,78",  "Grundnahrungsmittel" ],
  [ "11.04.2025", "Edeka Braunfels",     "Iglo Schlemmerfilet"       ,"2,77",  "Grundnahrungsmittel" ],
  [ "11.04.2025", "Edeka Braunfels",     "Iglo Schlemmerfilet"       ,"2,77",  "Grundnahrungsmittel" ],
  [ "11.04.2025", "Edeka Braunfels",     "Haribo Primavera"          ,"0,77",  "Süsskram" ],
  [ "11.04.2025", "Edeka Braunfels",     "Geflügelmortadella"        ,"2,38",  "Belag" ],
  [ "15.04.2025", "Rewe Center",         "Geflügelmortadella"        ,"2,38",  "Belag" ],
  [ "15.04.2025", "Rewe Center",         "Gouda"                     ,"2,99",  "Belag" ],
  [ "15.04.2025", "Rewe Center",         "Schafskäse Leicht"         ,"3,58",  "Grundnahrungsmittel" ],
  [ "15.04.2025", "Rewe Center",         "Maultaschen"               ,"2,98",  "Grundnahrungsmittel" ],
  [ "15.04.2025", "Rewe Center",         "Milch"                     ,"4,76",  "Grundnahrungsmittel" ],
  [ "15.04.2025", "Rewe Center",         "Milch"                     ,"2,97",  "Grundnahrungsmittel" ],
  [ "15.04.2025", "Rewe Center",         "Schlemmerfilet"            ,"5,38",  "Grundnahrungsmittel" ],
  [ "15.04.2025", "Rewe Center",         "Schlemmerfilet"            ,"5,38",  "Grundnahrungsmittel" ],
  [ "15.04.2025", "Rewe Center",         "Nudeln"                    ,"3,96",  "Grundnahrungsmittel" ],
  [ "15.04.2025", "Rewe Center",         "Wasser"                    ,"1,74",  "Getränke" ],
  [ "15.04.2025", "Rewe Center",         "Traubensaft"               ,"5,96",  "Getränke" ],
  [ "15.04.2025", "Rewe Center",         "Kalkstopp Tabs"            ,"2,75",  "Haushalt" ],
  [ "15.04.2025", "Rewe Center",         "Duschgel"                  ,"2,49",  "Körperpflege" ],
  [ "15.04.2025", "Globus",              "Haribo Primavera"          ,"0,69",  "Süsskram" ],
  [ "15.04.2025", "Globus",              "Haribo Mäuse"              ,"0,69",  "Süsskram" ],
  [ "15.04.2025", "Globus",              "Haribo Saure Goldbären"    ,"0,69",  "Süsskram" ],
  [ "15.04.2025", "Globus",              "Knoppers"                  ,"2,98",  "Süsskram" ],
  [ "15.04.2025", "Globus",              "Apfelkuchenschnitte"       ,"2,75",  "Süsskram" ],
  [ "15.04.2025", "Globus",              "Meztgerei SB"              ,"3,58",  "Grundnahrungsmittel" ],
  [ "15.04.2025", "Globus",              "Metzgerei SB"              ,"4,27",  "Grundnahrungsmittel" ],
  [ "15.04.2025", "Globus",              "Erbsen und Möhrchen"       ,"1,69",  "Grundnahrungsmittel" ],
  [ "15.04.2025", "Globus",              "Cornichons"                ,"1,49",  "Grundnahrungsmittel" ],
  [ "15.04.2025", "Globus",              "Miracel Whip"              ,"2,98",  "Grundnahrungsmittel" ],
  [ "15.04.2025", "Globus",              "Bananen"                   ,"0,87",  "Obst" ],
  [ "15.04.2025", "Globus",              "Brot"                      ,"2,75",  "Grundnahrungsmittel" ],
  [ "15.04.2025", "Globus",              "Salami"                    ,"1,99",  "Belag" ],
  [ "16.04.2025", "Penny",               "Gouda"                     ,"2,99",  "Belag" ],
  [ "16.04.2025", "Penny",               "Kinder Schokobons"         ,"3,99",  "Süsskram" ],
  [ "15.04.2025", "Globus",              "Schinken"                  ,"1,49",  "Belag" ],
  [ "16.04.2025", "Edeka Braunfels",     "Knorr Fix"                 ,"0,78",  "Grundnahrungsmittel" ],
  [ "16.04.2025", "Edeka Braunfels",     "Erdbeeren"                 ,"3,58",  "Obst" ],
  [ "16.04.2025", "Edeka Braunfels",     "Bio Eier"                  ,"3,99",  "Grundnahrungsmittel" ],
  [ "16.04.2025", "Globus",              "Licher Naturradler"        ,"4,59",  "Getränke" ],
  [ "16.04.2025", "Globus",              "Monster Energy"            ,"1,58",  "Getränke" ],
  [ "16.04.2025", "Globus",              "Brot"                      ,"1,58",  "Grundnahrungsmittel" ],
  [ "16.04.2025", "Globus",              "Brot"                      ,"1,58",  "Grundnahrungsmittel" ],
  [ "16.04.2025", "Globus",              "Brot"                      ,"2,75",  "Grundnahrungsmittel" ],
  [ "16.04.2025", "Globus",              "Brot"                      ,"0,99",  "Grundnahrungsmittel" ],
  [ "16.04.2025", "Globus",              "Metzgerei SB"              ,"4,06",  "Grundnahrungsmittel" ],
  [ "16.04.2025", "Globus",              "Metzgerei SB"              ,"3,86",  "Grundnahrungsmittel" ],
  [ "16.04.2025", "Globus",              "Metzgerei SB"              ,"6,55",  "Grundnahrungsmittel" ],
  [ "16.04.2025", "Globus",              "Metzgerei SB"              ,"7,99",  "Grundnahrungsmittel" ],
  [ "16.04.2025", "Globus",              "Metzgerei SB"              ,"4,23",  "Grundnahrungsmittel" ],
  [ "16.04.2025", "Globus",              "Dinkelküstchen"            ,"2,49",  "Grundnahrungsmittel" ],
  [ "16.04.2025", "Globus",              "Cola Zero"                 ,"4,38",  "Getränke" ],
  [ "16.04.2025", "Globus",              "Marshmellows"              ,"2,19",  "Süsskram" ],
  [ "16.04.2025", "Globus",              "Dickmanns"                 ,"2,29",  "Süsskram" ],
  [ "16.04.2025", "Globus",              "Kochschinken"              ,"2,98",  "Belag" ],
  [ "23.04.2025", "Rewe Center",         "Wasser"                    ,"1,74",  "Getränke" ],
  [ "23.04.2025", "Rewe Center",         "Kasten Bizzl"              ,"8,99",  "Getränke" ],
  [ "23.04.2025", "Rewe Center",         "Kasten Bizzl"              ,"8,99",  "Getränke" ],
  [ "23.04.2025", "Globus",              "Toilettenpapier"           ,"3,75",  "Haushalt" ],
  [ "23.04.2025", "Globus",              "Gouda"                     ,"2,39",  "Belag" ],
  [ "23.04.2025", "Globus",              "Bio Eier"                  ,"4,49",  "Grundnahrungsmittel" ],
  [ "23.04.2025", "Globus",              "Geflügelmortadella"        ,"1,19",  "Belag" ],
  [ "23.04.2025", "Globus",              "Kochschinken"              ,"1,49",  "Belag" ],
  [ "23.04.2025", "Globus",              "Königsberger Klopse"       ,"5,37",  "Grundnahrungsmittel" ],
  [ "23.04.2025", "Globus",              "Wasser"                    ,"2,19",  "Getränke" ],
  [ "23.04.2025", "Globus",              "YFood"                     ,"8,97",  "Grundnahrungsmittel" ],
  [ "23.04.2025", "Globus",              "YFood"                     ,"8,97",  "Grundnahrungsmittel" ],
  [ "23.04.2025", "Globus",              "Barilla Pesto"             ,"1,79",  "Grundnahrungsmittel" ],
  [ "23.04.2025", "Globus",              "Dickmanns"                 ,"1,99",  "Süsskram" ],
  [ "23.04.2025", "Globus",              "Knoppers Mini"             ,"1,99",  "Süsskram" ],
  [ "25.04.2025", "Rewe Solms",          "Frosta"                    ,"4,79",  "Grundnahrungsmittel" ],
  [ "25.04.2025", "Rewe Solms",          "Frosta"                    ,"4,79",  "Grundnahrungsmittel" ],
  [ "26.04.2025", "Lidl Solms",          "Joghurt"                   ,"2,85",  "Grundnahrungsmittel" ],
  [ "28.04.2025", "Rewe Center",         "Geflügelmortadella"        ,"2,38",  "Belag" ],
  [ "28.04.2025", "Rewe Center",         "Salami"                    ,"1,69",  "Belag" ],
  [ "28.04.2025", "Rewe Center",         "Gouda"                     ,"2,99",  "Belag" ],
  [ "28.04.2025", "Rewe Center",         "Brot"                      ,"1,99",  "Grundnahrungsmittel" ],
  [ "28.04.2025", "Rewe Center",         "Brot"                      ,"1,99",  "Grundnahrungsmittel" ],
  [ "28.04.2025", "Rewe Center",         "Bio Eier"                  ,"4,99",  "Grundnahrungsmittel" ],
  [ "28.04.2025", "Rewe Center",         "Milch"                     ,"2,58",  "Grundnahrungsmittel" ],
  [ "28.04.2025", "Rewe Center",         "Frosta"                    ,"2,79",  "Grundnahrungsmittel" ],
  [ "28.04.2025", "Rewe Center",         "Frosta"                    ,"5,58",  "Grundnahrungsmittel" ],
  [ "28.04.2025", "Rewe Center",         "Frosta"                    ,"2,79",  "Grundnahrungsmittel" ],
  [ "28.04.2025", "Rewe Center",         "Milch"                     ,"5,78",  "Grundnahrungsmittel" ],
  [ "28.04.2025", "Rewe Center",         "Traubensaft"               ,"2,98",  "Getränke" ],
  [ "28.04.2025", "Rewe Center",         "Wasser"                    ,"1,74",  "Getränke" ],
  [ "28.04.2025", "Rewe Center",         "Kasten Bizzl"              ,"11,19", "Getränke" ]
]


if Rails.env.production?
  raise "Never run seeds in production!"
end

Item.destroy_all
Receipt.destroy_all
Category.destroy_all
Shop.destroy_all

data.each do |d|
  date, shop, item, price, category = d
  category = Category.find_or_create_by(:name => category)
  shop = Shop.find_or_create_by(:name => shop)
  date = Date.parse(date)
  price = price.gsub(',', '.').to_f

  receipt = Receipt.find_or_create_by(shopped_at: date, shop: shop)
  Item.create(name: item, price: price, amount: 1, category: category, receipt: receipt)
end