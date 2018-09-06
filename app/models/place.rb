class Place < ApplicationRecord

  belongs_to :producer

  validates :name, presence: true

end
