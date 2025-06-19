class Receipt < ApplicationRecord
  belongs_to :shop
  has_many :items
end
