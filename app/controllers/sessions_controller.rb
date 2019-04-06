class SessionsController < ApplicationController
    
    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if user
            # login!(user)
            redirect_to user_url(user)
        else 
            flash[:errors] = "Invalid credentials"
            # redirect_to new_session_url
            render :new
        end
    end
end
