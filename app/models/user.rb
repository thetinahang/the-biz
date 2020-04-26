# frozen_string_literal: true

class User < ApplicationRecord
  	has_secure_password
	has_many :queries, dependent: :destroy
  	accepts_nested_attributes_for :queries
end
