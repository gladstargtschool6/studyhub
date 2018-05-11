class Question < ApplicationRecord
    has_many :answers
    has_many :users, through: :answers

    has_many :categories
    has_many :answers, through: :categories
end
