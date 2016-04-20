class Company < ActiveRecord::Base
  belongs_to :city
  has_many :article_company_relationships
  has_many :articles, through: :article_company_relationships

  validates :name, presence: true, length: { maximum: 50 }
  validates :city_id, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, format:{ with: VALID_EMAIL_REGEX }
end
