class Address < ActiveRecord::Base
  belongs_to :user

  validates :address_line1, :city, :zipcode, presence: true
end
