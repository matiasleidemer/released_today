RSpec.describe ArtistRepository, type: :repository do
  let(:repository) { ArtistRepository.new }

  describe '#stale' do
    let(:stale_time) { Time.now - ArtistRepository::TWENTY_TWO_HOURS }
    let(:descendents) { Artist.new(name: 'Descendents', spotify_id: '1', updated_at: stale_time) }
    let(:jawbreaker) { Artist.new(name: 'Jawbreaker', spotify_id: '2', updated_at: stale_time, disabled_at: Time.now) }
    let(:black_flag) { Artist.new(name: 'Black Flag', spotify_id: '3') }
    let(:hwm) { Artist.new(name: 'HWM', spotify_id: '4', disabled_at: Time.now) }

    before do
      repository.clear
      repository.create(descendents)
      repository.create(jawbreaker)
      repository.create(black_flag)
      repository.create(hwm)
    end

    it 'returns stale not disabled artists' do
      stale_artists = repository.stale.call
      expect(stale_artists.map(&:name)).to eql(['Descendents'])
    end
  end
end
