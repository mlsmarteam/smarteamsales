class Category < ActiveRecord::Base
	
	has_many :article_category_relationships
	has_many :articles, through: :article_category_relationships

	validates :name, presence: true, length: { maximum: 50 }

	def has_articles?
		self.articles == nil
	end
end
