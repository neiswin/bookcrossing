class Book < ApplicationRecord

  validates :title, presence: true, length: { minimum: 2 }
  validates :author, presence: true, length: { minimum: 2 }

end
