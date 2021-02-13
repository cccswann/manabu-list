module Helpers

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[user_id]
    end

    def not_the_owner?(obj)
        if current_user != obj.user
            flash[:error] = "You do not have permission for that page."
            erb :"/users/dashboard"
        end
    end

end