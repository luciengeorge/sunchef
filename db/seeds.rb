puts "Cleaning DB..."
Testimonial.destroy_all
Recipe.destroy_all
Plan.destroy_all
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
puts "Creating plans..."
plans = [
  {
    name: "One Month",
    session_count: 4,
    price: 150
  },
  {
    name: "Three Months",
    session_count: 6,
    price: 250
  },
  {
    name: "Six Months",
    session_count: 12,
    price: 300
  }
]
plans.each do |p|
  Plan.create! p
end
puts "Plans created"
