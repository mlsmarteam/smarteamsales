class Mark < ActiveRecord::Base

	validates :name, presence: true
end
