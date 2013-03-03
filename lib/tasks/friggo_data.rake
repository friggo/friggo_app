namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    
    users = User.all(limit: 6)
    50.times do
      user_id = 2
      category_id = 1
      price = 2
      quantity_to_sell = 3
      name = Faker::Lorem.words(1)
      users.each { |user| user.products.create!(user_id: user_id, category_id: category_id, price: price, quantity_to_sell: quantity_to_sell, name: name ) }
    end
  end
end