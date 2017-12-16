Fabricator(:section_edit) do
  summary       { Faker::Lorem.paragraph(2) }
  admin_user	{ Fabricate(:admin_user) }
  section 		{ Fabricate(:section) }
end
