class Category < ApplicationRecord
    has_many :answers
    has_many :questions
    # belongs_to :user
end
