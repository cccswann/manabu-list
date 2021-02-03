class ApplicationController < Sinatra::Base

    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        #set :session_secret 
    end
    
    get '/' do
        puts "Hello World"
    end
end