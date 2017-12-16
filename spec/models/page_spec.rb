require 'rails_helper'

RSpec.describe Page, type: :model do
  it "has valid fabricator" do
  	expect(Fabricate(:page)).to be_valid
  end

  context "validations" do
  	let(:page) {Fabricate(:page)}
  	context "presence" do
  		it "#name" do
  			expect(page).to validate_presence_of(:name)
  		end
  		it "#permalink" do
  			expect(page).to validate_presence_of(:permalink)
  		end
  	end

  	context "length" do
  		it "#name" do
  			expect(page).to validate_length_of(:name).is_at_most(255)
  		end
  		it "#permalink" do
  			expect(page).to validate_length_of(:permalink).is_at_least(3)
  		end
  	end
  end

  context "associations" do
  	let(:page) {Fabricate(:page)}
  	it "has many sections" do
  		expect(page).to have_many(:sections)
  	end

  	it "has and belongs to many admin users" do
  		expect(page).to have_and_belong_to_many(:admin_users)
  	end

  	it "belongs to subject" do
  		expect(page).to belong_to(:subject)
  	end
  end
end
