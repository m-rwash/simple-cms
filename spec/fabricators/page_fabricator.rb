Fabricator(:page) do
  name       { Faker::Hobbit.character }
  permalink  { Faker::Internet.url }
  position   { Faker::Number.between(1, 10) }
  visible    true
  subject	 { Fabricate(:subject) }
end
