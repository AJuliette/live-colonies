# frozen_string_literal: true

class CreateStudios < ActiveRecord::Migration[5.2]
  def change
    create_table :studios do |t|
      t.string :name
      t.decimal :monthly_price

      t.timestamps
    end
  end
end
