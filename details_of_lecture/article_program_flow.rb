# <--- THE LIFECYCLE AND FLOW OF AN ARTICLE OBJECT --->

# first of all we need to initiate an instance variable - @article = Article.new
# This happens in the ArticlesController
# Next we add the attributes - the tilte and description
# Basically a form that will display when you go to an URI, lets say: articles/new
# It will display input bpxes to input the attributes title and description, and then a submit button
# Once it is submitted it will go back to the controller and will be handled in the ActionsController by the create action
# The create action is going to take the attributes and 'whitelist' them
# That is called strong parameters and started in Rails 4.0.0
# Once they are whitelisted the create action will need to create a new article instance variable w/ attributes
# and then it is going to try to save it to the database
# But before it does that it is going to go through the validations that we setup in our Article model
# Once it passes that it is going to populate the articles table with a new row 
