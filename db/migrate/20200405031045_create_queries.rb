# frozen_string_literal: true

class CreateQueries < ActiveRecord::Migration[6.0]
  def change
    create_table :queries do |t|
      t.string :name

      t.timestamps
    end
  end
end
