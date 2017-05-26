# First go to: https://github.com/twbs/bootstrap-sass

# Then scroll down to find (gem 'bootstrap-sass', '~> 3.3.6')
# put this in your Gemfile right before (gem 'sass-rails', '~> 5.0')
# and then run - (bundle install --without production) in cmd

# Then navigate over to app/assets/stylesheets/application.css
  # application.css is a manifest file that'll be compiled into application.css, which will include all the files
  # listed below.

  # and create a new file in stylesheets called custom.css.scss
  # go back to https://github.com/twbs/bootstrap-sass and scroll until you find:
    # @import "bootstrap-sprockets";
    # @import "bootstrap";
  # add these two imports to the custom.css.scss file

  # Then in the same directory navigate to javascripts/application.js and add:
  # //= require bootstrap-sprockets, right under //= require jquery


  # ---------------- That's it you have successfully poted bootstrap to your Ruby app -------------------

# A very key part is to add the (gem jquery-rails): https://github.com/rails/jquery-ujs
# scroll down until you find - gem jquery-rails and put it in the Gemfile right before (group :development, :test do)
# and then run - (bundle install --without production) in cmd
# right after that add these in the application.js file under //= require rails-ujs:
  # //= require jquery
  # //= require jquery_ujs
# IF THIS IS NOT DONE THEN A LOT OF BOOTSTRAP COMPONENTS ARE NOT GOING TO WORK! because jquery won't be included
