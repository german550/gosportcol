class Create < ActiveRecord::Migration[6.0]
  def change
    create_table :registrations do |t|
      t.integer :user_id, foreign_key: true
      t.integer :event_id, foreign_key: true
      t.boolean :registered

      t.timestamps
    end
  end
end
