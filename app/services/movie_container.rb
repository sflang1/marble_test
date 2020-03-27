require 'models/movie'
require 'dry/container'
require 'dry/transaction'
require 'dry/transaction/operation'

module Movies
  class Validate
    include Dry::Transaction::Operation

    def call(input)
      # Validating params
      return Failure([:name_not_null, input[:movie][:name]]) unless input[:movie][:name].length > 0
      return Failure([:description_not_null, input[:movie][:description]]) unless input[:movie][:description].length > 0
      return Failure([:image_url_not_null, input[:movie][:image_url]]) unless input[:movie][:image_url].length > 0
      return Failure([:days_presented_invalid, input[:movie][:days_presented]]) unless input[:movie][:days_presented].length != 0 && input[:movie][:days_presented].match(/^L?M?X?J?V?S?D?$/)

      Success(input)
    end
  end

  class Create
    include Dry::Transaction::Operation

    def call(input)
      movie = Models::Movie.create(input[:movie])
      Success(movie)
    end
  end
end

class MovieContainer
  extend Dry::Container::Mixin

  namespace 'movies' do
    register 'validate' do
      Movies::Validate.new
    end

    register 'create' do
      Movies::Create.new
    end
  end
end
