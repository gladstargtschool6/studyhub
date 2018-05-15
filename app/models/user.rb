class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

    has_many :answers
    has_many :questions, through: :answers
    accepts_nested_attributes_for :questions
    # has_many :categories
    EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9._]+\.[a-z]{2,4}\z/i

  validates :name, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :email, presence: true, , uniqueness: true, format: EMAIL_REGEX, length: { minimum: 4 }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 } 

  

end
