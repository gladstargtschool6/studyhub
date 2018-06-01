class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
    # has_many :answers
    has_many :questions

end
