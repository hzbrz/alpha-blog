module ApplicationHelper
  # passing in another that controls the profile pic size...defaults to 80
  def gravatar_for(user, options = { size: 80 })
    # Gravatar url's are based on a MD5 hash of the user's email address, and in Ruby this MD5 algorithm is implemented
    # using the hexdigest method
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    # setting the size var to the value of the size 
    size = options[:size]
    gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    # image_tag basically created an image tag with gravatar_url as src
    image_tag(gravatar_url, alt: user.username, class: "img-circle")
  end
end
