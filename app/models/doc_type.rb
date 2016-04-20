class DocType < ActiveRecord::Base

	validates :name, presence: true
	
end
