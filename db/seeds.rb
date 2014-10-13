# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_create = User.new(name: 'admin', password: 'password', remember_token: SecureRandom.urlsafe_base64)
admin_create.password_confirmation = 'password'
admin_create.save