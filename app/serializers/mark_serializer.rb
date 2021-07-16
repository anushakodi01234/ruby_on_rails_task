class MarkSerializer < ActiveModel::Serializer
  attributes :id, :marks, :status, :student_id
  belongs_to :student
end
