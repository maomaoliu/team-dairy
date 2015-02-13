# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

team = Team.create(name: 'Team Dairy Team')
jesse = User.create(name: 'Jesse', team: team)
xiu = User.create(name: 'Xiu', team: team)
lu = User.create(name: 'Lu', team: team)

Event.create(message: 'The team is created today!', created_at: 2.weeks.ago, user: jesse)
Event.create(message: 'We have a big dinner, very exciting.', created_at: 1.week.ago, user: xiu)
Event.create(message: 'First mile stone.', created_at: 5.days.ago, user: lu)
