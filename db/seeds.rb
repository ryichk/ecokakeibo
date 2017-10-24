User.create(name: "市来亮", email: 'tohodaiichiki@gmail.com', password: 'mkb6zbg5', password_confirmation: 'mkb6zbg5', setai: 2)

require "csv"

cuisines_csv = CSV.readlines("db/cuisines.csv")
cuisines_csv.shift
cuisines_csv.each do |row|
  Cuisine.create(genre: row[1], name: row[2], calorie: row[3])
end

foodstuffs_csv = CSV.readlines("db_foodstuffs.csv")
foodstuffs_csv.shift
foodstuffs_csv.each do |row|
  Foodstuff.create(food: row[1], amount: row[2], cuisine_id: row[3])
end