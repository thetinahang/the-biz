class Term < ApplicationRecord
  TYPES = %w[
    artist.getSimilar
    artist.getInfo
    artist.getTags
    artist.getTopAlbums
    artist.getTopTags
    artist.getTopTracks
    artist.search
  ]

  belongs_to :query
end
