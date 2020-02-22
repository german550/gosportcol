class Addcolumn < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :age, :integer
    add_column :users, :f_sports, :string
    add_column :users, :level, :string
  end
end
