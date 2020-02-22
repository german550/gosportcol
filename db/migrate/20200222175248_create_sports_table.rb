class CreateSportsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :sports do |t|
      t.string :name

    end
  end
end
