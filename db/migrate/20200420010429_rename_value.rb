# frozen_string_literal: true

class RenameValue < ActiveRecord::Migration[6.0]
  def change
    rename_column :terms, :value, :artist
  end
end
