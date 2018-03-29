class User < ApplicationRecord

  attr_accessor :username2 # this value is not persisted in the DB


  has_many :articles # showing relationship to articles wher user is the parent

  before_save { self.email = email.downcase }

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 100 }, format: { with: VALID_EMAIL_REGEX }

  has_secure_password # this hashes the password when saving using bcrypt GEM - needs to be part of bundle

end
