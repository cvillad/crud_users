class AddSocialNetworksToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :social_networks, :user, null: false, foreign_key: true
  end
end
