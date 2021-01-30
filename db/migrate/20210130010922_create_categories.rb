class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string "name"
      t.string "slug"
      t.text "description"
      t.string "image"
      t.integer "priority", default: 0

      t.timestamps
    end
  end
end
