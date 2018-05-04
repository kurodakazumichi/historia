class AddYmdToHistories < ActiveRecord::Migration[5.1]
  def change
    add_column :histories, :year, :string
    add_column :histories, :month, :string
    add_column :histories, :day, :string
  end
end
