class Article < ActiveRecord::Base

  # Since the Article is the 'many' side in the 'one-to-many' associations 'user' is singular
  belongs_to :user
  # It enforces that an article object has a title and description before hitting the database
  # Make sure to reload the console before testing out the validations
  # the length validation ensures that the length is not too short, like a letter or a word
  # minimum 3 characters and max is 50
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }

  # Adding a validation to ensure that all the articles have an user associated with them
  validates :user_id, presence: true
end
