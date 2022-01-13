class Score < ApplicationRecord
    belongs_to :users
    belongs_to :tournaments
end
