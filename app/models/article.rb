class Article < ActiveRecord::Base
  belongs_to :mark

  has_many :article_category_relationships
  has_many :categories, through: :article_category_relationships

  has_many :article_company_relationships
  has_many :companies, through: :article_company_relationships
  accepts_nested_attributes_for :companies


  has_many :article_sale_relationships
  has_many :sales, through: :article_sale_relationships

  validates :name, presence: true, length: { maximum: 50 }
  validates :sale_amount, presence: true
  validates :min_stock, presence: true
  validates :mark_id, presence: true

  def has_categories?
  	self.categories != nil
  end

  def has_companies?
  	self.companies != nil
  end

  def has_sales?
    self.sales != nil
  end
end
