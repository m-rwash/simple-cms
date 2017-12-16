require 'rails_helper'

RSpec.describe SectionEdit, type: :model do
  it "has valid fabricator" do
  	expect(Fabricate(:section_edit)).to be_valid
  end

  context "associations" do
  	let(:section_edit) {Fabricate(:section_edit)}
  	it "belogns to admin user" do
  		expect(section_edit).to belong_to(:admin_user)
  	end
  	it "belogns to section" do
  		expect(section_edit).to belong_to(:section)
  	end
  end
end
