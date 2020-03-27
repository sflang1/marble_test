require 'services/create_reservation'
require 'services/get_reservations'

module Acme
  class Reservations < Grape::API
    format :json
    post '/reservations' do
      json = {}
      CreateReservation.new.call(params) do |m|
        m.success do |reservation|
          json = {code: 'success', id: reservation.id}
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

    get '/reservations' do
      json = {}
      GetReservations.new.call(params) do |m|
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
