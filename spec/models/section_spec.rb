require 'rails_helper'

RSpec.describe Section, type: :model do
  it "has valid fabricator" do
  	expect(Fabricate(:section)).to be_valid
  end

  context "validations" do
  	let(:section) { Fabricate(:section) }
  	it "presence of #name" do
  		expect(section).to validate_presence_of(:name)
  	end
  	it "length of #name" do
  		expect(section).to validate_length_of(:name).is_at_most(255)
  	end

  	it "#content type options" do
  		expect(section).to validate_inclusion_of(:content_type).in_array(['HTML', 'text'])
  																.with_message("must be one of: text, HTML")
  	end
  end

  context "associations" do
  	let(:section) { Fabricate(:section) }
  	it "has many section edits" do
  		expect(section).to have_many(:section_edits)
  	end
  	it "has many admin users through section_edits" do
  		expect(section).to have_many(:admin_users).through(:section_edits)
  	end
  end
end
