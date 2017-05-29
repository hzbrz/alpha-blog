class User < ActiveRecord::Base

  # Since the User is the 'one' side in the 'one-to-many' associations 'articles' is plural
  has_many :articles

  # Anytime an email is created for an user I want to save it as lowercase in the db so all the emails are lowercase
  # This is doable using 'before_save' helper method, it takes the email value and downcases it beofre the user hits db
  before_save { self.email = email.downcase }

  # Adding user validations:
  #   -  username must be present and unique
  #   -  email must be present and unique
  #   -  validate email format using regex

  # Makes sure that attribute username is present and defines the length an username can be
  # uniqueness ensure uniqueness of username and also ignores case-sensitivity
  validates :username, presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }

  # formats the email based on the regex in VALID_EMAIL_REGEX
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end
