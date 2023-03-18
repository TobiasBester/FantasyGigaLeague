class Manager < ApplicationRecord

  belongs_to :user

  validates :name, presence: true, length: {maximum: 50, minimum: 2}
  validates :fave_team, presence: true, length: {maximum: 25, minimum: 2}
  validates :country, presence: true, length: {maximum: 50, minimum: 2}

end
