class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.string :content

      t.timestamps null: false
    end
  end
end
