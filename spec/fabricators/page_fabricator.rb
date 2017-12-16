Fabricator(:page) do
  name       { Faker::Hobbit.character }
  permalink  { Faker::Lorem.word }
  position   { Faker::Number.between(1, 10) }
  visible    true
  subject	 { Fabricate(:subject) }
end
