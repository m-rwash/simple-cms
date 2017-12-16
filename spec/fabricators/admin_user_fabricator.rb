Fabricator(:admin_user)do
	first_name { Faker::Name.first_name }
	last_name  { Faker::Name.last_name }
	email 	   { Faker::Internet.email }
	username   { Faker::Internet.user_name(4) }
	password   { Faker::Internet.password }
end