# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

u1 = User.create(:email => "cgoodmac@gmail.com", :first_name => "Chris", :last_name => "Goodmacher", :password => "1", :password_confirmation => "1", :description => "Basketball Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus cursus posuere ligula, id dignissim dolor pharetra sed.", :is_admin => "on")

u2 = User.create(:email => "cgoodmacher@gmail.com", :first_name => "Joe", :last_name => "Schmoe", :password => "1", :password_confirmation => "1", :description => "Basketball Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus cursus posuere ligula, id dignissim dolor pharetra sed.", :is_admin => "on", :is_teacher => "on")

