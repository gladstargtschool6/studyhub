class Category < ApplicationRecord
    has_many :answers
    has_many :questions
    # belongs_to :user

  validates :name, presence: true, uniqueness: true, length: { minimum: 5, maximum: 20 }
end
