class ArtistRepository < Hanami::Repository
  TWENTY_TWO_HOURS = 22 * 60 * 60

  associations do
    has_many :albums
  end

  def find_with_albums(id)
    aggregate(:albums).where(id: id).as(Artist).one
  end

  def stale
    artists
      .where(disabled_at: nil)
      .where { updated_at < Time.now - TWENTY_TWO_HOURS }
  end
end
