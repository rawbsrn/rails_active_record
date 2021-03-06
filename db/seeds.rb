Product.destroy_all
User.destroy_all
product_id_array = []
50.times do |index|
  Product.create!(name: Faker::Space.unique.meteorite, cost: Faker::Number.between(from: 1, to: 10), country_of_origin: Faker::Address.country) 
      product_id_array.push(Product.last.id)                  
end
##push product id to array, for each loop or random. look up Array.random/.sample
p "Created #{Product.count} products"

p product_id_array

product_id_array.each do |num|
  5.times do |index|
  Review.create!(author: Faker::FunnyName.two_word_name,content_body: Faker::Lorem.paragraph_by_chars(number: 250, supplemental: false), rating: Faker::Number.between(from: 1, to: 5),  product_id: num)   
  end
end

p "Created #{Review.count} reviews"

generated_password = Devise.friendly_token.first(8)
# User.create!(email: 'admin@testaccount.com',username: 'testadmin', password: 'correcthorsebatterystaple', admin: true)
User.create!(email: 'admin@admin.com',username: 'admin', password: generated_password, admin: true)
p "Created account admin:#{generated_password}, use these credentials wisely."
