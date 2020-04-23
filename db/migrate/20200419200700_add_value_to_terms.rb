# frozen_string_literal: true

class AddValueToTerms < ActiveRecord::Migration[6.0]
  def change
    add_column :terms, :value, :string
  end
end
