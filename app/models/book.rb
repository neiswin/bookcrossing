class Book < ApplicationRecord
  has_many :comments

  validates :title, presence: true, length: { minimum: 2 }
  validates :author, presence: true, length: { minimum: 2 }

end
