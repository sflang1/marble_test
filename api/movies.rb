require 'services/create_movie'
require 'services/get_movies'

module Acme
  class Movies < Grape::API
    format :json
    post '/movies' do
      json = {}
      CreateMovie.new.call(params) do |m|
        m.success do |movie|
          json = {code: 'success', id: movie.id}
        end
        m.failure :validate do |validation|
          json = {code: 'error', message: validation}
        end
        m.failure do |error|
          json = {code: 'error', message: error}
        end
      end
      json
    end

    get '/movies/:day' do
      json = {}
      GetMovies.new.call(params) do |m|
        m.success do |array|
          json = {code: 'success', response: array.map(&:to_hash)}
        end
        m.failure :validate do |validation|
          json = {code: 'error', message: validation}
        end
        m.failure do |error|
          json = {code: 'error', message: error}
        end
      end
      json
    end
  end
end
