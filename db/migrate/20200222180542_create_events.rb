class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :place
      t.date :date
      t.time :time
      t.float :price
      t.text :description

      t.timestamps
    end
  end
end
