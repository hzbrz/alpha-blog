# To add secure password to your User model and users table, do this:
#   add has_secure_password method in model (user.rb)
#     then add gem 'bcrypt' in Gemfile
#       then generate antother migration to add password_digest column/attribute in your users table
#         * The password can then be referred with the virtual attribute 'password'
#         * One way hashed digest of string is stored in the users table under password_digest column/attribute
#         * Can use the resource.authenticate('password') to compare passwords

# After adding passwords the backend for User is complete and now we can signup users through the UI in our website
