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
  {name: 'joe', gender: 'male', city: 'sacramento', state: 'ca', birthdate: '1985-02-02'},
  {name: 'sam', gender: 'female', city: 'sacramento', state: 'ca', birthdate: '1985-02-02'},
  {name: 'jane', gender: 'female', city: 'sacramento', state: 'ca', birthdate: '1985-02-02'},
  {name: 'sue', gender: 'male', city: 'sacramento', state: 'ca', birthdate: '1985-02-02'}]


users.each_with_index do |user, i|
  profile = user.create_profile(profiles[i])
end