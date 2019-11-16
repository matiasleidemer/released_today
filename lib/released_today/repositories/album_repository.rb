class AlbumRepository < Hanami::Repository
  associations do
    belongs_to :artist
  end

  def find_with_artist(id)
    aggregate(:artist).where(id: id).map_to(Album).one
  end
end
