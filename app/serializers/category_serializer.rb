class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
    # has_many :answers
    has_many :questions
    # def current
    #   {
    #     title: "titel",
    #     content: "content"
    #   }
    # end
end
