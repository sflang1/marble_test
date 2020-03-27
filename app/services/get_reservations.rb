require 'models/reservation'
require 'dry/transaction'

class GetReservations
  include Dry::Transaction
  step :validate
  step :query

  private

  def validate(input)
    return Failure([:invalid_date, input[:start_date]]) unless input[:start_date].match(/^\d{2}-\d{2}-\d{4}$/)
    return Failure([:invalid_date, input[:end_date]]) unless input[:end_date].match(/^\d{2}-\d{2}-\d{4}$/)

    Success(input)
  end

  def query(input)
    start_date = Time.strptime(input[:start_date], '%d-%m-%Y')
    end_date = Time.strptime(input[:end_date], '%d-%m-%Y')
    array = Models::Reservation.where(Sequel[:date] <= end_date.to_i).where(Sequel[:date] >= start_date.to_i)

    Success(array)
  end
end
