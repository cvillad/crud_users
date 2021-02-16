class SocialNetwork < ApplicationRecord
    validates :name, presence: true
    validates :link, presence: true
    belongs_to :user
end
