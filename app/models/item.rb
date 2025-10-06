class Item < ApplicationRecord
  belongs_to :receipt
  belongs_to :category

  def total
    price * amount
  end
end
