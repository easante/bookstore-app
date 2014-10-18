class Book < ActiveRecord::Base
  belongs_to :publisher
  has_many :publications, dependent: :destroy
  has_many :authors, through: :publications

  validates :title, presence: true
  validates :isbn, presence: true
  validates :description, presence: true
  validates :published_at, presence: true
  validates :publisher_id, presence: true
  validates :page_count, numericality: { only_integer: true, greater_than: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0.0 }

  mount_uploader :book_cover, BookCoverUploader
end
