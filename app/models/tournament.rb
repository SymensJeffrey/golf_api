class Tournament < ApplicationRecord
    has_many :scores
    belongs_to :user
    belongs_to :course
end
