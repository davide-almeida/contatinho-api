# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[7.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :number
      t.string :zip_code
      t.string :city
      t.string :state
      t.string :country
      t.string :complement
      t.string :latitude
      t.string :longitude
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
