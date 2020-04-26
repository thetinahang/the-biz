# frozen_string_literal: true

class Term < ApplicationRecord
  TYPES = %w[
    artist.getSimilar
    artist.getInfo
    artist.getTopAlbums
    artist.getTopTags
    artist.getTopTracks
    artist.search
    track.getInfo
    track.getSimilar
    track.getTopTags
    track.search
  ].freeze

  belongs_to :query
end
