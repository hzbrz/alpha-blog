class AddDescriptionToArticles < ActiveRecord::Migration[5.1]
  def change
    # add_column helper method takes in the table name, attribute name or column name, type for the atrribute
    add_column :articles, :description, :text
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
