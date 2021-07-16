class Student < ApplicationRecord
    has_many :marks, dependent: :destroy
    has_many :subjects, through: :marks
    validates :name, presence: true, length: {minimum: 3, maximum: 25}
    validates :gender, inclusion: %w(male female)
    validates :date_of_birth, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: {case_sensitive: false},
                              length: { maximum: 105},
                              format:{with: VALID_EMAIL_REGEX}
    validates :uuid, presence: true, uniqueness: true
    
    before_validation :set_random_uuid, on: :create

 private
    def set_random_uuid
        self.uuid = SecureRandom.uuid
    end
end