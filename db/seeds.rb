# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create! :name => 'First User', :email => 'user1@test.com', :password => '123456', :password_confirmation => '123456', :confirmed_at => DateTime.now
User.create! :name => 'Second User', :email => 'user2@test.com', :password => '123456', :password_confirmation => '123456', :confirmed_at => DateTime.now

admin = User.create! :name => 'Admin', :email => 'admin@test.com', :password => '123456', :password_confirmation => '123456',
                      :confirmed_at => DateTime.now
admin.role = :admin
admin.save

Type.create! :type_name => "auto"
Type.create! :type_name => "building"
