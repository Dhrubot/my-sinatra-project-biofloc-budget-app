class UserController < ApplicationController


    get '/signup' do
        #should show options for signup
        erb :'users/new'
    end

    post '/users' do
        @user = User.new(username: params[:username], email: params[:email], password: params[:password])
        if @user.save
            redirect to "/users/#{@user.id}" #will need to refractor this to redirect to the username.
        else
            redirect to '/signup'
        end
    end

    get '/login' do
        erb :'/users/login'
    end

    get '/users/:id' do
        @user = User.find(params[:id])

        erb :'/users/index'
    end
end