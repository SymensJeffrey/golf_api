class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates_uniqueness_of :email, :case_sensitive => false
    
    has_many :scores
    has_many :tournaments
end
