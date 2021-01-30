class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.references :user, foreign_key: true, null: false
      t.text :url

      t.timestamps
    end
  end
end
