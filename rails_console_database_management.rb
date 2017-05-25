# <--- CREATING AND STORING ARTICLES or MODELS TO THE articles table/ database using the rails console --->

# Just because we have created this model, rails gives us getters and setters for each attribute on the table
# Go to cmd and type in - rails console to test out the articles table and its functions
# Article.all to see if it exists, (ModelName.all for general purpose)
# And since we have getters and setters already we can define the table from the console
# article.title = "something" to set the title of the article and add it to articles table
# article.save generates a SQL query for us, it INSERTS into the articles table all the values
# mass assignment to the table is just like instantiating a new object using the constructor
# article = Article.new(title: "", description: "" ...)
# Or you can do Article.create(title: "", description: "" ...) - directly inserts it into the database

# <--- EDITING AND DELETING values from the database using the rails console  --->

# article = Article.find(:id) to grab the article with that id number, article = Article.find(2)
# just type in article and you will see that we have grabbed the article of that id number
# now do article.title = "message" to edit the title of the 2nd article
# article.save to save it to the database
# To delete it is the same process
# article = Article.find(3) grabs the third article from the articles table
# article to check which article it has grabbed
# then simply do article.destroy

# At this point our Article model is empty
# Creating articles from the console without validations in the model is a problem
# because we can enter in empty articles into the database
# We can only counter that by adding validations in our model file
# That checks if the attributes exist in an article before we save it to the database

# To check what is the error if something goes wrong type in:
# article.errors.full_messages, (object_name.errors.full_messages)
