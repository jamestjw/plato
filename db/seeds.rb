# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Organisation.delete_all
User.delete_all

leong = User.create!(name: 'Leong',
    password: 'kaodim',
    email: 'juanwhei@kaodim.com',
    organisation_owner: true
)

james = User.create!(name: 'James',
    password: 'kaodim',
    email: 'james_tan97@outlook.com',
)

seng = User.create!(name: 'Wei Seng',
    password: 'kaodim',
    email: 'jt59@hw.ac.uk',
)

nick = User.create!(name: 'Nicolas',
    password: 'kaodim',
    email: 'youknowjamest@gmail.com',
)

kaodim = Organisation.create!(
    name: 'Kaodim',
    description: 'The Kaodim Group is the #1 services marketplace in Southeast Asia, providing a faster, more dependable way to hire professional services you need from plumbers, photographers,cleaners, movers, caterers, wedding planners, yoga instructors and many more.',
    user: leong,
    users: [leong, james, seng,  nick]
)