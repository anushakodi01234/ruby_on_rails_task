class Subject < ApplicationRecord
    has_many :marks, dependent: :destroy
    has_many :students, through: :marks
    validates :name, presence: true, length: {minimum: 3, maximum: 50}
    validates :uuid, presence: true, uniqueness: true


    before_validation :set_random_uuid, on: :create
 private
    def set_random_uuid
        self.uuid = SecureRandom.uuid
    end
end