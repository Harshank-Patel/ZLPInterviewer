class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phoneNumber
      t.string :email
      t.string :interviewDate
      t.string :interviewTime

      t.timestamps
    end
  end
end
