class Address < ApplicationRecord
  belongs_to :contact
  validates :state, :zip, :city, presence: true
end
