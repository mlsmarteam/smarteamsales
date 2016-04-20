class ExpenditureType < ActiveRecord::Base

	validates :name, presence: true
end
