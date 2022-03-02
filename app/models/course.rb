class Course < ApplicationRecord
    has_many :tournaments
    has_many :scores
end
