class Expenditure < ActiveRecord::Base
  belongs_to :expenditure_type

  has_many :expenditure_user_relationships
  has_many :users, through: :expenditure_user_relationships

  validates :expenditure_type_id, presence: true
  validates :amount, presence: true
  validates :description, presence: true
  validates :date, presence: true

  def has_users?
  	self.users != nil
  end
 
end
