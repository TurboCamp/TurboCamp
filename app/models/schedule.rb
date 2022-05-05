class Schedule < ApplicationRecord
    validates :title, presence: true
    validates :calendar_id, presence: true, uniqueness: true 
    validates :start, presence: true
    validates :end, presence: true
    validates :location, presence: true
end
