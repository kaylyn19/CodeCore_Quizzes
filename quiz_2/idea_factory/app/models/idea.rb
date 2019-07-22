class Idea < ApplicationRecord
    has_many :reviews, dependent: :destroy
    validates :title, presence: true, uniqueness: true
    validates :description, presence: true
end
