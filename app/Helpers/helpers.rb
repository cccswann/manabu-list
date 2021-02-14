module Helpers

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        User.find(session[:user_id])
    end

    def not_the_owner?(obj)
        if current_user != obj.user
            flash[:error] = "You do not have permission for that page."
            erb :"/users/dashboard"
        end
    end

    def percent_complete(completed, total)
        p ((completed.to_f/total.to_f) * 100).round
    end

end