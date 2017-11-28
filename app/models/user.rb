class AdminUser < ApplicationRecord
	has_many_and_belongs_to :pages
end
