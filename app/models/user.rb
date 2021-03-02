class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :social_networks, dependent: :destroy
  accepts_nested_attributes_for :social_networks, allow_destroy: true
  has_one_attached :image, dependent: :destroy  do |attachable|
      attachable.variant :thumb, resize: "50x50"
      attachable.variant :profile, resize: "150x150"
  end
  validates :image, content_type: ["image/png", "image/jpg", "image/jpeg"]
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }
  validates :username, presence: true, uniqueness: true
  validates :description, presence: true
end
