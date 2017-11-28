class AdminUser < ApplicationRecord
	has_many_and_belongs_to :pages
	has_many :section_edits
end
