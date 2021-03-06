class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:stripe_connect]
  has_one :creator
  has_many :comments, dependent: :destroy
  has_many :perks, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :rooms
  has_many :messages
  
  serialize :perk_subscriptions, Array

  mount_uploader :image, ImageUploader
  
  def can_receive_payment?
    uid && provider? && access_code? &&  publishable_key?
  end
end

