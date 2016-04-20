class Turn < ActiveRecord::Base
	has_many :user_turn_relationships
	has_many :turns , through: :user_turn_relationships

	def has_users?
		self.users != nil
	end
end
