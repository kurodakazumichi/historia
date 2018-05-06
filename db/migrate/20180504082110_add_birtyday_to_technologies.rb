class AddBirtydayToTechnologies < ActiveRecord::Migration[5.1]
  def change
    add_column :technologies, :year, :integer
    add_column :technologies, :month, :integer
    add_column :technologies, :day, :integer
  end
end
