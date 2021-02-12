ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

require 'sinatra/activerecord'
require 'sinatra'
require 'open-uri'
require 'dotenv/load'


ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_all 'app'
#require './app/contollers/application_controller'
