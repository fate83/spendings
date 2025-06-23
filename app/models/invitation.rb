class Invitation < ApplicationRecord
  belongs_to :membership
  belongs_to :team

  before_create :generate_token

  def generate_token
    assign_attributes(token: SecureRandom.hex(32))
  end

  def accepted?
    accepted_at.present?
  end
end
