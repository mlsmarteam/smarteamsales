class User < ActiveRecord::Base
  belongs_to :doc_type
  belongs_to :city
  has_many :expenditure_sale_relationships
  has_many :sales, through: :expenditure_sale_relationships
  has_many :user_turn_relationships
  has_many :turns, through: :user_turn_relationships

  validates :doc_type_id, presence:true
  validates :doc_number, presence:true
  validates :name, presence: true, length: { maximum: 50 }
  validates :last_name, presence:true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format:{ with: VALID_EMAIL_REGEX }
  validates :birthdate, presence: true
  validates :city_id, presence: true

  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  has_secure_password

  def has_sales?
  	self.sales != nil
  end
end
