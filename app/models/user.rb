class User < ActiveRecord::Base
  include Gravtastic
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  gravtastic

  has_many :comments
  has_many :pastes

  before_create { |u| u.api_key = SecureRandom.hex }

  validates :api_key, uniqueness: true
end
