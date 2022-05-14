class AddTimestampsToArticles < ActiveRecord::Migration[7.0]
  def change
    # First argument is the table name
    # Second argument is the column name
    # Third argument is the column type
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
