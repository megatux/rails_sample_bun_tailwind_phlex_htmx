class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.text :details
      t.integer :stock
      t.boolean :published

      t.timestamps
    end
  end
end
