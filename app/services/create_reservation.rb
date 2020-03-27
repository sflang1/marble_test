require 'models/movie'
require 'models/reservation'
require 'dry/transaction'

class CreateReservation
  include Dry::Transaction
  step :validate
  step :create

  private

  def validate(input)
    return Failure([:movie_not_exists, input[:reservation][:movie_id]]) unless Models::Movie.where(id: input[:reservation][:movie_id]).count() > 0
    return Failure([:invalid_date, input[:reservation][:date]]) unless input[:reservation][:date].match(/^\d{2}-\d{2}-\d{4}$/)
    date = Time.strptime(input[:reservation][:date], '%d-%m-%Y')
    count = Models::Reservation.where(movie_id: input[:reservation][:movie_id], date: date.to_i).count()
    return Failure([:full_day, input[:reservation][:date]]) if count == 1

    Success(input)
  end

  def create(input)
    date = Time.strptime(input[:reservation][:date], '%d-%m-%Y')
    Success(Models::Reservation.create(movie_id: input[:reservation][:movie_id], date: date.to_i))
  end
end
