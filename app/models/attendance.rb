class Attendance < ApplicationRecord
    belongs_to :user
    belongs_to :event

    after_create :welcome_sending

    def welcome_sending 
        AttendanceMailer.welcome_attendance(self).deliver_now
    end
end
