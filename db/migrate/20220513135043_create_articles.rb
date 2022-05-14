class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    # First argument is the table name
    # Second argument is the column type
    create_table :articles do |t|
      t.string :title
      t.text :description
    end
  end
end
