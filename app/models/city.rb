class City < ActiveRecord::Base
  belongs_to :province

  validates :name, presence: true, length: { maximum: 50 }
  validates :province_id, presence: true
end
