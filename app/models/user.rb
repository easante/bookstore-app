class User < ActiveRecord::Base
  has_many :addresses
  has_many :orders

  validates :first_name, :last_name, :email, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false },
    format: { with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i }

  has_secure_password

  before_create :generate_token

  accepts_nested_attributes_for :addresses

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end

  def to_param
    token
  end

  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end
end
