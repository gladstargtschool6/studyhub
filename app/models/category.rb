class Category < ApplicationRecord
    has_many :answers
    has_many :questions
end
