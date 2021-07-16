class SubjectSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :students, through: :marks
end
