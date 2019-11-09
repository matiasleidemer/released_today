Hanami::Model.migration do
  change do
    create_table :artists do
      primary_key :id
      column :name, String, null: false
      column :spotify_id, String, null: false
      column :metadata, "jsonb"
      column :disabled_at, DateTime
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false

      index :spotify_id
      index :disabled_at
    end
  end
end
