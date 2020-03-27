require 'services/movie_container'

class CreateMovie
  include Dry::Transaction(container: MovieContainer)

  step :validate, with: 'movies.validate'
  step :create, with: 'movies.create'
end