require 'rails_helper'

RSpec.describe AdminUser, type: :model do
	it "has valid fabricator" do
		expect(Fabricate(:admin_user)).to be_valid
	end

	context "validations" do
		context "presence" do
			it "#first_name" do
				user = Fabricate.build(:admin_user, first_name: nil)
				expect(user).to_not be_valid
				expect(user.errors[:first_name].size).to eq(1)
			end

			it "#last_name" do
				user = Fabricate.build(:admin_user, last_name:  nil)
				expect(user).to_not be_valid
				expect(user.errors[:last_name].size).to eq(1)
			end

			it "#username" do
				user = Fabricate.build(:admin_user, username: nil)
				expect(user).to_not be_valid
				expect(user.errors[:username].size).to eq(1)
			end

			it "#email" do
				user = Fabricate.build(:admin_user, email: nil)
				expect(user).to_not be_valid
				expect(user.errors[:email].size).to eq(2) # 1 for presence and 1 for format
			end

			it "#password" do
				user = Fabricate.build(:admin_user, password: nil)
				expect(user).to_not be_valid
				expect(user.errors[:password].size).to eq(1)
			end
		end

		context "uniqueness" do
			it "#username" do
				Fabricate(:admin_user, username: "testusername")
				expect { Fabricate(:admin_user, username: "testusername") }.to raise_error ActiveRecord::RecordInvalid
			end

			it "#email" do
				Fabricate(:admin_user, email: "test@user.com")
				expect { Fabricate(:admin_user, email: "test@user.com") }.to raise_error ActiveRecord::RecordInvalid
			end
		end
	end
	context "properties" do
		let (:admin_user) { Fabricate(:admin_user) }
		it "#name" do
			expect(admin_user.name).to eq("#{admin_user.first_name} #{admin_user.last_name}")
		end
	end

	context "associations" do
		let (:admin_user) { Fabricate(:admin_user) }
		it "#has and belongs to many pages" do
			expect(admin_user).to have_and_belong_to_many(:pages)
		end
		it "#has many sections" do
			expect(admin_user).to have_many(:sections).through(:section_edits)
		end
		it "#has many sections edits" do
			expect(admin_user).to have_many(:section_edits)
		end
	end
end