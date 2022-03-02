class Score < ApplicationRecord
    belongs_to :user
    belongs_to :tournament
    belongs_to :course

    validates :token, :presence => true
    validates :name, :presence => true
end
