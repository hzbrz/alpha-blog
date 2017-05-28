class User < ActiveRecord::Base
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
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }
end
