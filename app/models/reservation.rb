module Models
  class Reservation < Sequel::Model
    many_to_one :movie

    def to_hash
      {
        date: Time.at(date).strftime('%d-%m-%Y'),
        movie: movie.id
      }
    end
  end
end
