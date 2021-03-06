# frozen_string_literal: true

class Query < ApplicationRecord
  has_many :terms, dependent: :destroy
  accepts_nested_attributes_for :terms
end
