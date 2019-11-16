Hanami::Model.migration do
  change do
    create_table :albums do
      primary_key :id
      foreign_key :artist_id, :artists, on_delete: :cascade, null: false
      column :spotify_id, String, null: false
      column :name, String, null: false
      column :image_url, String
      column :number_of_tracks, Integer, null: false
      column :released_at, Date
      column :metadata, 'jsonb'
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false

      index :artist_id
      index :spotify_id
    end
  end
end
