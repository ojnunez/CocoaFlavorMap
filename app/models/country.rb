class Country < ApplicationRecord

  has_many :producers, dependent: :destroy

  validates :name, presence: true

end
