require 'rails_helper'

RSpec.describe Subject, type: :model do
  it "has valid fabricator" do
  	expect(Fabricate(:subject)).to be_valid
  end

  context "validations" do
  	let(:subject) {Fabricate.build(:subject)}
  	context "presence" do
  		it "#name" do
  			expect(subject).to validate_presence_of(:name)
  		end
  	end
  	context "length" do
  		it "#name" do
  			expect(subject).to validate_length_of(:name).is_at_most(255)
  		end
  	end
  end

  context "associations" do
  	let(:subject) {Fabricate.build(:subject)}
  	it "#has many pages" do
  		expect(subject).to have_many(:pages)
  	end
  end
end
