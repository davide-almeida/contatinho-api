# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[7.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :cpf_code
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :contacts, :cpf_code, unique: true
  end
end
