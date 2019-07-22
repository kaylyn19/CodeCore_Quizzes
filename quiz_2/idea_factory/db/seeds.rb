# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.delete_all
Idea.delete_all
User.delete_all

20.times.each do
    User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: 'password'
    )
end
users = User.all

10.times.each do
    i = Idea.create(
        title: Faker::Book.title,
        description: Faker::ChuckNorris.fact,
        user: users.sample
    )
    if i.valid?
        i.reviews = rand(0..5).times.map do
            Review.create(
                body: Faker::ChuckNorris.fact,
                idea: i,
                user: users.sample
            )
        end
    end
end

p "generated #{Idea.all.count} ideas"
p "generated #{Review.all.count} reviews"
p "generated #{users.count} users"