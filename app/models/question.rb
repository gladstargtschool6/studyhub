class Question < ApplicationRecord
    has_many :answers, dependent: :destroy
    has_many :users, through: :answers

    belongs_to :category

    validates :title, presence: true
    # , length: { minimum: 5, maximum: 100 }
    
    # validates :category_id, presence: true
  
end
