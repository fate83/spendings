class Receipt < ApplicationRecord
  belongs_to :shop
  belongs_to :team
  has_many :items, dependent: :destroy

  validates :shopped_at, presence: true
end
