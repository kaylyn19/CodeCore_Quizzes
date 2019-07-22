# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times.each do
    i = Idea.create(
        title: Faker::Book.title,
        description: Faker::ChuckNorris.fact,
    )
    if i.valid?
        i.reviews = rand(0..5).times.map do
            Review.create(
                body: Faker::ChuckNorris.fact,
            )
        end
    end
end

p "generated #{Idea.all.count} ideas"
p "generated #{Review.all.count} reviews"