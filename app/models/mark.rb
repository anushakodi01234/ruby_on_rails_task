class Mark < ApplicationRecord
    belongs_to :student
    belongs_to :subject
    validates_uniqueness_of :student, scope: :subject_id
    validates :marks,numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, presence: true
    before_save :set_status

    def set_status
        if self.marks < 35
            self.status = "Fail"
        else
            self.status = "Pass"
        end
    end
end
