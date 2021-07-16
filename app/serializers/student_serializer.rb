class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :date_of_birth, :gender
  has_many :subjects, through: :marks
  has_many :marks
 
end
