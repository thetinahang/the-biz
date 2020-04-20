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
  ]

  belongs_to :query
end
