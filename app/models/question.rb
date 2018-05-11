class Question < ApplicationRecord
    has_many :answers, dependent: :destroy
    has_many :users, through: :answers

    has_many :categorizations, dependent: :destory
    has_many :categories, through: :categorizations
end
