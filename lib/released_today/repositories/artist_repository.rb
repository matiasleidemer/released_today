class ArtistRepository < Hanami::Repository
  TWENTY_TWO_HOURS = 22 * 60 * 60

  def stale
    artists
      .where(disabled_at: nil)
      .where { updated_at < Time.now - TWENTY_TWO_HOURS }
  end
end
