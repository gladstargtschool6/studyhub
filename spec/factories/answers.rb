FactoryGirl.define do 
  factory :answer do
    title 'a' * 20
    content 'a' * 20
    user
    category
  end
end