class CreateTechnologyTags < ActiveRecord::Migration[5.1]
  def change
    create_table :technology_tags do |t|
      t.integer :technology_id
      t.integer :tag_id
      t.references :technology, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
