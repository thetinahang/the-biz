# frozen_string_literal: true

json.extract! query, :id, :name, :created_at, :updated_at
json.url query_url(query, format: :json)
