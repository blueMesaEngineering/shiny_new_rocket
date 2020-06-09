# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

random_number = Random.new

99.times do |n|
  stock_id = 1
  close = 500 + random_number.rand(0..(n/2))
  volume = random_number.rand(1000..5000)
  Datapoint.create!(stock_id:   stock_id,
                    close:      close,
                    volume:     volume)
end
