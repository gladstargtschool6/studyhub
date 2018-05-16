class Category < ApplicationRecord
    has_many :answers
    has_many :questions
    # belongs_to :user

  validates :name, presence: true, uniqueness: true, length: { minimum: 5, maximum: 20 }
    # scope :Business, -> { where(name: 'Business') }
    # scope :toys, -> { where(category: 'toys') }
    scope :newest_first, -> { order("created_at DESC")} 
    scope :search, lambda {|search| where(["name LIKE ?", "%#{search}%"])}
    
end
