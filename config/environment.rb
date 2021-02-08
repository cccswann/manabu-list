ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])


require_all 'app'
#require './app/contollers/application_controller'

require 'sinatra/activerecord'
require 'sinatra'
require 'open-uri'


ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

