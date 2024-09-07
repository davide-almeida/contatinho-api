# frozen_string_literal: true

class CreatePhones < ActiveRecord::Migration[7.2]
  def change
    create_table :phones do |t|
      t.string :number
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
