class SocialNetwork < ApplicationRecord
    validates :name, presence: true
    validates_each :name do |record, attribute, value|
        unless (value === "Twitter") || (value === "Facebook") || (value === "Linkedin") || (value === "Instagram") 
            record.errors.add(attribute, "must be a valid social network")
        end
    end
    validates :link, presence: true
    belongs_to :user, optional: true
end
