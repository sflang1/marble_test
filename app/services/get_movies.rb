require 'models/movie'
require 'dry/transaction'

class GetMovies
  include Dry::Transaction
  step :validate
  step :query

  private
  def validate(input)
    return Failure([:invalid_day, input[:day]]) unless 'LMXJVSD'.include? input[:day]
    Success(input)
  end

  def query(input)
    Success(Models::Movie.where(Sequel[:days_presented].like "%#{input[:day]}%").to_a)
  end
end