# frozen_string_literal: true

class RenameName < ActiveRecord::Migration[6.0]
  def change
    rename_column :terms, :name, :method
  end
end
