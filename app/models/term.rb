# frozen_string_literal: true

class Term < ApplicationRecord
  TYPES = %w[
    artist.getSimilar
    artist.getInfo
    artist.getTags
    artist.getTopAlbums
    artist.getTopTags
    artist.getTopTracks
    artist.search
    track.getInfo
    track.getSimilar
    track.getTags
    track.getTopTags
    track.search
  ].freeze

  belongs_to :query
end
