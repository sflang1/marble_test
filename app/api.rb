module Acme
  class API < Grape::API
    prefix 'api'
    format :json
    mount ::Acme::Ping
    mount ::Acme::Movies
    mount ::Acme::Reservations
  end
end