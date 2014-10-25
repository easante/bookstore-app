class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false },
    format: { with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i }

  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end
end
