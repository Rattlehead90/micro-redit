class User < ApplicationRecord
  has_many :posts
  has_many :comments
  before_save { email.downcase! }
  validates :name, presence: true, length: { minimum: 2 },
                   uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: VALID_EMAIL_REGEX, uniqueness: true
end
