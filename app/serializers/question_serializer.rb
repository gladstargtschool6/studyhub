class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :content
  belongs_to :category
end
