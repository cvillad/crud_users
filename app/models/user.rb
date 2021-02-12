class User < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, presence: true
    validates :email, presence: true
    validates :social_media, presence: true 
    validates :description, presence: true
end
