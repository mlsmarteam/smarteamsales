class ArticleSaleRelationship < ActiveRecord::Base
  belongs_to :article
  belongs_to :sale
end
