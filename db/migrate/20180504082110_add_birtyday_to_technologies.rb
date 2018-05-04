class AddBirtydayToTechnologies < ActiveRecord::Migration[5.1]
  def change
    add_column :technologies, :year, :string
    add_column :technologies, :month, :string
    add_column :technologies, :day, :string
  end
end
