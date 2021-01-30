class AddColumnsToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :og_title, :string
    add_column :articles, :og_image, :text
    add_column :articles, :og_description, :string
    add_column :articles, :og_url, :text
  end
end
