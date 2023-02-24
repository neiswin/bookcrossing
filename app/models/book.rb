class Book < ApplicationRecord
  has_many :comments, dependent: :destroy

  belongs_to :user

  validates :title, presence: true, length: { minimum: 2 }
  validates :author, presence: true, length: { minimum: 2 }

end
