FactoryGirl.define do 
  factory :question do
    title 'a' * 20
    content 'a' * 20
    category 'a' * 20
    user
    category
    answer
  end
end