class UserController < ApplicationController


    get '/profile' do
        @user = User.find(session[:user_id])

        erb :'users/index'
    end

    get '/signup' do
        #should show options for signup
        erb :'users/new'
    end

    post '/users' do
        @user = User.new(username: params[:username], email: params[:email], password: params[:password])
        if @user.save
            session[:user_id] = @user.id
            redirect to "/profile" 
        else
            redirect to '/signup'
        end
    end

    get '/login' do
        erb :'/users/login'
    end

    post '/login' do
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to "/profile"
        else
            redirect to '/login'
        end
    end



    get '/logout' do
        session.clear
        redirect '/'
    end
end