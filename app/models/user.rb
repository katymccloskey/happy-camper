class User < ApplicationRecord
  has_many :favorites
  has_many :campgrounds, through: :favorites

  validates_presence_of :username

  devise :database_authenticatable, :registerable, :validatable,
         :recoverable, :rememberable, :trackable, :omniauthable,
          :omniauth_providers => [:google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email
     user.name = auth.info.first_name
     user.picture = auth.extra.raw_info.picture
     end
  end
end
