class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      # attribute :username of type string
      t.string :username
      t.string :email
      t.timestamps
    end
  end
end
