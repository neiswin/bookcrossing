class Comment < ApplicationRecord
  belongs_to :book
  belongs_to :user


  validates :body, presence: true, length: { minimum: 2 }
end
