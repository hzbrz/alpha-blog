class AddUserIdToArticles < ActiveRecord::Migration[5.1]
  def change
    # while creating a migration if the migration name starts with the prefix 'add' for example: 'add_user_to_blabla' it
    # will create a migration that lets you add stuff to the already existing tables, but if it starts with the 'create'
    # prefix for example: 'create_articles'  it will create a table.

    # add_column helper method takes in the table name, attribute name or column name, type for the atrribute
    # foreign-key has to be of type integer
    add_column :articles, :user_id, :integer
  end
end
