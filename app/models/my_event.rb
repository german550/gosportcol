class MyEvent < ApplicationRecord
    belongs_to :user
    has_one_attached :pic
<<<<<<< HEAD
    has_many :registrations
end
=======
    has_many :events

>>>>>>> d1c4f0493ef854e8dc441b22806a3f7824775e8c
    