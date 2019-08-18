# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

organisations = Organisation.create([
    {name: 'britts slavery', hourly_rate: 13.56}, 
    {name: 'chomps', hourly_rate: 10.57}])
users = User.create([
    {organisation_id: 1, name: 'brendan', email: 'b@test.com', password: 'asd'}, {organisation_id: 1, name: 'britt', email: 'b@test.com', password: 'asd'},{organisation_id: 2, name: 'josh', email: 'j@test.com', password: 'asd'}
    ])
shifts = Shift.create([
    {user_id: 1, start: '2019-07-19 20:00:00', finish: '2019-07-19 22:00:00', break_length: 50}, 
    {user_id: 1, start: '2019-07-18 20:00:00', finish: '2019-07-18 22:00:00', break_length: 30}, 
    {user_id: 2, start: '2019-07-18 20:00:00', finish: '2019-07-18 22:00:00', break_length: 30},
    {user_id: 3, start: '2019-07-19 20:00:00', finish: '2019-07-19 22:00:00', break_length: 30}])