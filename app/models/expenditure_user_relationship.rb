class ExpenditureUserRelationship < ActiveRecord::Base
  belongs_to :expenditure
  belongs_to :users
end
