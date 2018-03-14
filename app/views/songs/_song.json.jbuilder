json.extract! song, :id, :name, :lyrics, :duration, :genre, :created_at, :updated_at
json.url song_url(song, format: :json)
