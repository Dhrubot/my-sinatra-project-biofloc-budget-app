class UserController < ApplicationController


    get '/signup' do
        #should show options for signup
        erb :'users/new'
    end

    post '/users' do
        raise params.inspect
    end
end