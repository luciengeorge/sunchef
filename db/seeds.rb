puts "Cleaning DB..."
Testimonial.destroy_all
Recipe.destroy_all
puts "DB cleaned"
puts "Creating testimonials..."
4.times do
  Testimonial.create! name: Faker::Name.name , body: Faker::Lorem.sentences.join(", ")
end
puts "Testimonials created"
puts "Creating recipes..."
20.times do
  Recipe.create! name: Faker::Food.dish, servings: rand(1..4), category: Recipe.categories.keys.sample, prep_time: "#{(rand * 3).floor}h#{(rand * 60).floor}"
end
puts "Recipes created"
