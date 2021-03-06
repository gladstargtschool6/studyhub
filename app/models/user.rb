class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
    def self.from_omniauth(auth)  
      # binding.pry
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.name = auth.info.name
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      end
    end

    has_many :answers
    has_many :questions, through: :answers
    accepts_nested_attributes_for :questions

    # has_many :categories
    EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9._]+\.[a-z]{2,4}\z/i

    validates :name, presence: true, uniqueness: true, length: { minimum: 4 }
    validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
    validates :password, presence: true, length: { minimum: 6 }
    # validates :password_confirmation, presence: true, length: { minimum: 6 } 



end
