class Bearer < ApplicationRecord
  acts_as_paranoid

  has_many :stocks

  validates :name, presence: true
end
