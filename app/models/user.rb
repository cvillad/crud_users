class User < ApplicationRecord
    has_many :social_networks, dependent: :destroy
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :description, presence: true
end
