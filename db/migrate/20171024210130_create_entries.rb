class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :story, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :content

      t.timestamps null: false
    end
  end
end
