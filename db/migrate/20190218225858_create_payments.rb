class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :stay, foreign_key: true
      t.string :yearmonth

      t.timestamps
    end
  end
end
