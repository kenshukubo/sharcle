class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :slug
      t.integer :priority, default: 0
      t.timestamps
    end
  end
end
