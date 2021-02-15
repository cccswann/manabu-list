class ApplicationController < Sinatra::Base
    include Helpers

    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, ENV['SESSION_KEY']
        register Sinatra::Flash
    end
    
    get '/' do
        @users = User.all
        if logged_in?
            erb :"/users/dashboard"
        else
            erb :"/sessions/login"
        end
    end

    error Sinatra::NotFound do
        erb :error
    end

end