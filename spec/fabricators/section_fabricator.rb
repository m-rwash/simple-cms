Fabricator(:section) do
  name         { Faker::RockBand.name}
  position     { Faker::Number.between(1, 10) }
  visible      true
  content_type %w(HTML text).sample
  content      { Faker::Lorem.paragraph(8) }
  page		   { Fabricate(:page) }
end
