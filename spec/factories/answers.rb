FactoryGirl.define do 
  factory :answer do
    content 'a' * 20
    user
    question
    category
  end
end