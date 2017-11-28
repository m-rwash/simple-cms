class Page < ApplicationRecord
	belongs_to :subject
	has_many_and_belongs_to :admin_users
end
