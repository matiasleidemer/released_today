RSpec.describe Album, type: :entity do
  describe '#released_today?' do
    it 'returns true when the album was released today' do
      album = Album.new(released_at: Date.today)
      expect(album.released_today?).to eql(true)
    end

    it 'returns true if the album was released before today' do
      album = Album.new(released_at: Date.today - 1)
      expect(album.released_today?).to eql(false)
    end
  end
end
