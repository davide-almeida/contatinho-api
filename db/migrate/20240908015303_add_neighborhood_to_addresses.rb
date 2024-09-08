# frozen_string_literal: true

class AddNeighborhoodToAddresses < ActiveRecord::Migration[7.2]
  def change
    add_column :addresses, :neighborhood, :string
  end
end
