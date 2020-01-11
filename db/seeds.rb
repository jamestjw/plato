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
    organisation_owner: true
)

nick = User.create!(name: 'Nicolas',
    password: 'kaodim',
    email: 'youknowjamest@gmail.com',
)

kaodim = Organisation.create!(
    name: 'Kaodim',
    description: 'The Kaodim Group is the #1 services marketplace in Southeast Asia, providing a faster, more dependable way to hire professional services you need from plumbers, photographers,cleaners, movers, caterers, wedding planners, yoga instructors and many more.',
    user: leong,
    users: [leong, james]
)

grab = Organisation.create!(
    name: 'Grab',
    description: 'Grab is a technology company offering different ride-hailing transport services, online food delivery and payment solutions. .',
    user: nick,
    users: [seng,  nick]
)

kdboard = Board.create!(
    name: 'Data Team',
    active: true,
    organisation: kaodim
)

partyboard = Board.create!(
    name: 'For partying',
    active: true,
    organisation: kaodim
)

nickCard = Card.create!(
    title: 'Surcharge',
    color: 'red',
    description: 'Make sure implementation of surcharge finishes on time.',
    board: kdboard
)

Task.create!(
    card: nickCard,
    completed: false,
    detail: 'Make seng work'
)

Task.create!(
    card: nickCard,
    completed: true,
    detail: 'Make maish work'
)
Task.create!(
    card: nickCard,
    completed: true,
    detail: 'Make mango  work'
)
Task.create!(
    card: nickCard,
    completed: false,
    detail: 'Make leong work'
)

leongCard = Card.create!(
    title: 'GMV',
    color: 'red',
    description: 'Make sure GMV increases 50%.',
    board: kdboard
)

Task.create!(
    card: leongCard,
    completed: false,
    detail: 'Make seng work'
)

Task.create!(
    card: leongCard,
    completed: true,
    detail: 'Make maish work'
)

nickCard2 = Card.create!(
    title: 'Surcharge',
    color: 'red',
    description: 'Make sure implementation of surcharge finishes on time.',
    board: partyboard
)

Task.create!(
    card: nickCard2,
    completed: false,
    detail: 'Make seng work'
)

Task.create!(
    card: nickCard2,
    completed: true,
    detail: 'Make maish work'
)
Task.create!(
    card: nickCard2,
    completed: true,
    detail: 'Make mango  work'
)
Task.create!(
    card: nickCard2,
    completed: false,
    detail: 'Make leong work'
)

leongCard2 = Card.create!(
    title: 'GMV',
    color: 'red',
    description: 'Make sure GMV increases 50%.',
    board: partyboard
)

Task.create!(
    card: leongCard2,
    completed: false,
    detail: 'Make seng work'
)

Task.create!(
    card: leongCard2,
    completed: true,
    detail: 'Make maish work'
)