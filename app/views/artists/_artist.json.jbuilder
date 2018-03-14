json.extract! artist, :id, :name, :description, :genre, :nationality, :active_time, :created_at, :updated_at
json.url artist_url(artist, format: :json)
