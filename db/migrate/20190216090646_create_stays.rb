# frozen_string_literal: true

class CreateStays < ActiveRecord::Migration[5.2]
  def change
    create_table :stays do |t|
      t.references :studio, foreign_key: true
      t.references :tenant, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
