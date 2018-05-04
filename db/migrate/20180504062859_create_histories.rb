class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|
      t.string :title
      t.text :description
      t.references :technology, foreign_key: true

      t.timestamps
    end
  end
end
