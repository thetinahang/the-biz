# frozen_string_literal: true

class AddUserToQueries < ActiveRecord::Migration[6.0]
  def change
    add_reference :queries, :user, index: true
  end
end
