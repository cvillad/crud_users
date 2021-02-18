class SocialNetworkValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless (value === "Twitter") || (value === "Facebook") || (value === "Linkedin") || (value === "Instagram") 
        record.errors.add(attribute, "must be a valid social network")
      end
    end
end