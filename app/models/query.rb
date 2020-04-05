class Query < ApplicationRecord
	has_many :terms, dependent: :destroy
end
