require 'rubygems'
require 'bundler/setup'

require 'rake'

task :environment do
  ENV['RACK_ENV'] ||= 'development'
  require File.expand_path('config/environment', __dir__)
end

task routes: :environment do
  Acme::API.routes.each do |route|
    method = route.request_method.ljust(10)
    path = route.origin
    puts "     #{method} #{path}"
  end
end

namespace :db do
  desc 'Run migrations'
  task :migrate, [:version] do |t, args|
    require 'sequel/core'
    Sequel.extension :migration
    version = args[:version].to_i if args[:version]
    Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://development.db') do |db|
      Sequel::Migrator.run(db, 'db/migrations', target: version)
    end
  end
end
