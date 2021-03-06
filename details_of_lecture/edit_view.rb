# <---- edit.html.erb FILE HOSTED HERE BECAUSE OF PARTIAL AND REDUNDANCY ------>

# This file has been created to store the edit view which is being taken out because of redundant code
# Nevertheless, it has a lot of valuable about how the new view is different from the edit view
# So we will store it here.

# <h1>Edit existsing article</h1>
#
# <%-# This code block is for displaying the error if the user fails validations setup in the Article model %>
# <%-# @article.errors.any? checks if there are any errors in the @article instance %>
# <% if @article.errors.any? %>
# <h2>The following errors prevented the article from getting created.</h2>
#   <%-# The ul (unorederd list) because there are multiple validations and more than one message can show %>
#   <ul>
#     <% @article.errors.full_messages.each do |msg| %>
#         <li> <%= msg %> </li>
#     <% end %>
#   </ul>
# <% end %>
#
# <%- # @article is just an instance variable that has been initiated in the ArticlesController edit action %>
# <%- # Since this is a model-back form rails will auto prefill the form from the database based on the article id %>
# <%- # Which is perfect because this is the form for editing articles %>
# <%= form_for @article do |f| %>
#   <p>
#     <%- # We are working with the title and description attributes %>
#     <%= f.label :title %><br>
#     <%= f.text_field :title %>
#   </p>
#   <p>
#     <%= f.label :description %><br>
#     <%= f.text_area :description %>
#   </p>
#   <p>
#     <%- # Rails is so smart that it knows that this view is associated with the edit action %>
#     <%- # And thats why this button will automatically say 'Update article' instead of 'Create article' %>
#     <%= f.submit %>
#   </p>
# <% end %>
#
# <p>
#   <%= link_to "Back to articles listing", articles_path %>
# </p>
