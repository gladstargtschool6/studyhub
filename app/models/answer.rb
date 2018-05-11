class Answer < ApplicationRecord
    belongs_to :user
    belongs_to :question

    has_many :categories
    has_many :questions, through: :categories
end
