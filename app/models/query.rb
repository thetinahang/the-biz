class Query < ApplicationRecord
  QUERY_TYPES = %w[
    getSimilar
  ]

	has_many :terms, dependent: :destroy
	accepts_nested_attributes_for :terms
end
