class User < ApplicationRecord
  has_many :favorites
  has_many :campgrounds, through: :favorites

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :rememberable, :trackable, :omniauthable,
    :omniauth_providers => [:google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email
     end
  end
end
