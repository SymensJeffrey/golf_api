class Score < ApplicationRecord
    belongs_to :user
    belongs_to :tournament

    validates :token, :presence => true
    validates :name, :presence => true
end
