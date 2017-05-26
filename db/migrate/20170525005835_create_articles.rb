# This was created by doing rails generate migration create_articles
class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    # rails db:migrate to create table
    # rails db:rollback to revert the changes made to the table
    # But that is not the preferred way to do things
    # when a mistake is made it is better to make another migration with the changes
    # rails generate migration add_description_to_articles, will add a description field to the table articles
    create_table :articles do |t|
      # Here we could have done t.timestaps to get the :created_at and :updated_at but we did not
      # So we did it in the next migration using the add_column method
      t.string :title
      # the reason we can access :title anywhere is because symbols are immutable and they carry the same value
      # everywhere so ':title' is the same everywhere (just a string column in the database/articles table).
    end
  end
end
