class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable,
         :trackable

  belongs_to :team
  alias :current_team :team

  has_many :memberships
  has_many :teams, through: :memberships
end
