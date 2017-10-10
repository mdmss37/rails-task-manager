class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :due
      t.boolean :done, default: false, null: false

      t.timestamps
    end
  end
end
