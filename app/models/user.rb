class User < ApplicationRecord
    has_many :user_stats
    has_many :stats, through: :user_stats

    has_secure_password
    
    validates :username, uniqueness: true, presence: true
    validates :password, presence: true, if: :password
    
end
