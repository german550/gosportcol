class MyEvent < ApplicationRecord
    belongs_to :user
    has_one_attached :pic
<<<<<<< HEAD
    has_many :events
=======
>>>>>>> master
    has_many :registrations
    end
    