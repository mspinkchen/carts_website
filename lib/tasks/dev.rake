namespace :dev do 
  task fake: :environment do
    Product.destroy_all

    200.times do |i|
      Product.create!(
        name: FFaker::Product.product,
        description: FFaker::Lorem.paragraph,
        price: FFaker::PhoneNumber.area_code,
        image: FFaker::Avatar.image
        )
    end

    puts "Have created fake product"
    puts "Now you have #{Product.count} product data"
  end
  
end