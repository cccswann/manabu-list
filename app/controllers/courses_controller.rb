class CoursesController < ApplicationController

    get '/courses' do
        erb :"/courses/index"
    end

    get '/courses/edit' do
        @user = current_user 
        erb :"/courses/update"
    end

    get '/course/:id' do
        @course = Course.find(params["id"])
        erb :"courses/show"
    end

    post '/course' do
        @user = current_user
        if logged_in?
            @course = Course.new(params)
            @course.save
            @user.courses << @course
            flash[:message] = "Saved"
            erb :"/users/dashboard"
        else
            redirect '/login'
        end
    end

    delete '/course/:id' do
        @user = current_user
        if logged_in? && @user.courses.find(params[:id])
            @course = Course.find(params[:id])
            @course.delete
            flash[:message] = "#{@course.course_name} Deleted"
            erb :"/users/dashboard"
        else
            flash[:message] = "Unable to delete"
            erb :"/users/dashboard"
        end
    end

    patch '/course' do
        @user = current_user
        if logged_in?
            if params[:course][:course_name].find {|p| p.strip.empty?}
                flash[:message] = "Input Cannot Be Blank"
                redirect '/dashboard'
            else
                params[:course][:original_course][:id].each_with_index do |id, index|
                    if @course = @user.courses.find(id)
                        unless @course.course_name == params[:course][:course_name][index]
                            @course.course_name = params[:course][:course_name][index].strip
                            @course.save
                        end
                        unless @course.subject == params[:course][:subject][index]
                            @course.subject = params[:course][:subject][index].strip
                            @course.save
                        end
                        unless @course.status == params[:course][:status][index]
                            @course.status = params[:course][:status][index].strip
                            @course.save
                        end
                        unless @course.completed_lectures == params[:course][:completed_lectures][index]
                            @course.completed_lectures = params[:course][:completed_lectures][index].strip
                            @course.save
                        end
                        unless @course.total_lectures == params[:course][:total_lectures][index]
                            @course.total_lectures = params[:course][:total_lectures][index].strip
                            @course.save
                        end
                        if params[:course][:check] != nil && params[:course][:check].include?(@course.id.to_s)
                            @course.delete
                        end
                    else
                        flash[:message] = "Unable to update course."
                        redirect '/dashboard'
                    end
                end
                flash[:message] = "Updated"
                redirect '/dashboard'
            end
        else
            redirect '/login'
        end
    end

end