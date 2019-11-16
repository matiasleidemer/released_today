Hanami::Model.migration do
  change do
    create_table :users do
      primary_key :id
      column :name, String, null: false
      column :email, String, null: false
      column :provider, String, null: false
      column :uid, String, null: false
      column :metadata, 'jsonb'
      column :preferences, 'jsonb', default: '{}'
      column :admin, TrueClass, default: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false

      index :email
      index :preferences, type: :gin
    end
  end
end
