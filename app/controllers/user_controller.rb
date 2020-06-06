class UserController < ApplicationController

    #index
    get '/dashboard' do
        @user = User.find(session[:user_id])

        erb :'users/index'
    end

    #show
    get '/profile' do
        @user = User.find(session[:user_id])

        erb :'users/show'
    end

    #new
    get '/signup' do
        #should show options for signup
        erb :'users/new'
    end

    #create
    post '/users' do
        @user = User.new(username: params[:username], email: params[:email], password: params[:password])
        if @user.save
            session[:user_id] = @user.id
            redirect to "/" 
        else
            redirect to '/signup'
        end
    end

    get '/login' do
        erb :'/users/login'
    end

    #authenticate
    post '/login' do
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to "/"
        else
            redirect to '/login'
        end
    end



    get '/logout' do
        session.clear
        redirect '/'
    end

    #edit
    get '/profile/edit' do
        @user = User.find(session[:user_id])

        erb :'users/edit'
    end

    #update
    patch '/profile' do
        @user = User.find(session[:user_id])
        if params[:password] == ""
            @user.update(email: params[:email])
        elsif params[:email] == ""
            @user.update(password: params[:password])
        else
            @user.update(email: params[:email], password: params[:password])
        end

        redirect to '/profile'
    end

    #destroy
    delete '/profile/delete' do
        @user = User.find(session[:user_id])
        @user.delete

        redirect to '/'
    end

end