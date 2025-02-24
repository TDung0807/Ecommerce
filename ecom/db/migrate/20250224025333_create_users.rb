class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :fullname
      t.string :location
      t.date :birth

      t.timestamps
    end
  end
end
