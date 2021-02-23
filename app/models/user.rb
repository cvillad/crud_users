class User < ApplicationRecord
    has_many :social_networks, dependent: :destroy
    has_one_attached :image, dependent: :destroy  do |attachable|
        attachable.variant :thumb, resize: "50x50"
        attachable.variant :profile, resize: "50x50"
    end
    validates :image,content_type: ["image/png", "image/jpg", "image/jpeg"]
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP}
    validates :description, presence: true
end
