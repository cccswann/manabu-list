class SessionsController < ApplicationController

    get '/login' do
        if logged_in?
            redirect '/dashboard'
        else
            erb :"/sessions/login"
        end
    end

    post '/login' do
        user = User.find_by_email(params["user"]["email"])
        if user && user.authenticate(params["user"]["password"])
            session["user_id"] = user.id
            flash[:success] = "Successfully logged in!"
            erb :"/users/dashboard"
        else
            flash[:error] = "Invalid credentials"
            redirect '/login'
        end
    end

    get "/logout" do
        session.clear
        redirect '/'
    end


end