class Sale < ActiveRecord::Base
  belongs_to :user

  has_many :article_sale_relationships
  has_many :article, through: :article_sale_relationships

  validates :amount, presence: true
  validates :date, presence: true
  validates :user_id, presence: true
  def has_articles?
  	self.articles != nil
  end
end
