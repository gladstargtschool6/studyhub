# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def seed_users
  user_id = 0
  10.times do 
    User.create(
      name: "test#{user_id}",
      email: "test#{user_id}@test.com",
      password: '123456',
      password_confirmation: '123456'
    )
    user_id = user_id + 1
  end
end


def seed_categories
  science = ['chapter I', 'chapter II', 'chapter III']
  misllenous = ['Arts and Humanities', 'Physical Science and Engineering', 'Math and Logic',
          'Computer Science', 'Data Science', 'Economics and Finance', 'Business',
          'Social Sciences', 'Language', 'Other']
  math = ['chapter 1', 'chapter 2', 'chapter 2', 'chapter 4']

  science.each do |name|
    Category.create(name: name)
  end

  misllenous.each do |name|
    Category.create(name: name)
  end

  math.each do |name|
    Category.create(name: name)
  end
end
    # t.text "content"
    # t.integer "user_id"
    # t.integer "question_id"
    # t.integer "category_id"

def seed_questions
  categories = Category.all

  categories.each do |category|
    5.times do
      Question.create(
        title: Faker::Lorem.sentences[0], 
        content: Faker::Lorem.sentences[0], 
        user_id: rand(1..9), 
        category_id: category.id
      )
    end
  end
end
def seed_answers
  questions = Question.all

  questions.each do |question|
    5.times do
      Answer.create(
        content: Faker::Lorem.sentences[0], 
        user_id: rand(1..9), 
        # category_id: category.id,
        question_id: question.id
      )
    end
  end 
end

seed_users
seed_categories
seed_questions
seed_answers