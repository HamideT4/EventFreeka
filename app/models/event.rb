class Event < ApplicationRecord

    belongs_to :admin, optional: true, class_name: "User"

    has_many :attendances
    has_many :users, through: :attendances, :dependent => :destroy

    validates :start_date,
    presence: true
    validate :start_date_cannot_be_in_the_past

    def start_date_cannot_be_in_the_past
        if start_date.present? && start_date < Date.today
            errors.add(:start_date, "can't be in the past")
        end
    end

    validates :duration,
    presence: true, numericality: {only_integer: true, greater_than: 0},
    format: {with: /\A(\d+)[0,5]\z/, message: "must be a multiple of 5"}

   validates :title, 
   presence: true,
   length: {minimum: 5, maximum: 140}

   validates :description,
   presence: true, 
   length: {minimum: 1, maximum: 1000}

   validates :price,
   presence: true, numericality: {in: 1..1000}

   validates :location, presence: true
end
