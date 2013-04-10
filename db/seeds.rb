# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {email: 'joe', username: 'joe', password: '1234abcd', password_confirmation: '1234abcd'},
  {email: 'sam', username: 'sam', password: '1234abcd', password_confirmation: '1234abcd'},
  {email: 'jane', username: 'jane', password: '1234abcd', password_confirmation: '1234abcd'},
  {email: 'sue', username: 'sue', password: '1234abcd', password_confirmation: '1234abcd'}])

profiles = [
  {name: 'joe', points: 0, gender: 'male', in_relationship_with: 'sam', relationship_status: 'dating',
   anniversary: '2013-04-04', age: 16, city: 'sacramento', state: 'ca'},
  {name: 'sam', points: 0, gender: 'female', in_relationship_with: 'joe', relationship_status: 'dating',
   anniversary: '2013-04-04', age: 16, city: 'sacramento', state: 'ca'},
  {name: 'jane', points: 0, gender: 'female', in_relationship_with: 'sue', relationship_status: 'engaged',
   anniversary: '2013-04-04', age: 16, city: 'sacramento', state: 'ca'},
  {name: 'sue', points: 0, gender: 'male', in_relationship_with: 'jane', relationship_status: 'engaged',
   anniversary: '2013-04-04', age: 16, city: 'sacramento', state: 'ca'}]


users.each_with_index do |user, i|
  profile = user.create_profile(profiles[i])
  profile.update_attribute(:points, 0)
end