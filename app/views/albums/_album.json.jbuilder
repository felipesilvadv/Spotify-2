json.extract! album, :id, :title, :artist_id, :songs_id, :genre, :date, :number, :created_at, :updated_at
json.url album_url(album, format: :json)
