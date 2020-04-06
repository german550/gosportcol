class Event < ApplicationRecord
belongs_to :user
has_one_attached :pic
has_many :registrations, dependent: :destroy
end
