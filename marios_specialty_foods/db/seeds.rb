Product.destroy_all
product_id_array = []
10.times do |index|
  Product.create!(name: Faker::Space.unique.meteorite, cost: Faker::Number.between(from: 1, to: 10), country_of_origin: Faker::Lorem.word) 
      product_id_array.push(Product.last.id)                  
end
##push product id to array, for each loop or random. look up Array.random/.sample
p "Created #{Product.count} products"

p product_id_array

product_id_array.each do |num|
  7.times do |index|
  Review.create!(author: Faker::FunnyName.two_word_name,content_body: Faker::Hacker.say_something_smart, product_id: num)   
  end
end

p "Created #{Review.count} reviews"