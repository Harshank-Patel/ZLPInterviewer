class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :time
      t.string :interviewer
      t.string :room
      t.string :phoneNumber

      t.timestamps
    end
  end
end
