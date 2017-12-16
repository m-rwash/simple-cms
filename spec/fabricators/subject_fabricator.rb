Fabricator(:subject) do
  name       { Faker::RockBand.name}
  position   { Faker::Number.between(1, 10) }
  visible    true
end
