class UserController < ApplicationController

    # before '/*' do
    #     authentication_error unless request.path == '/login' || request.path == '/signup' || logged_in?
    # end
    
    ['/campaigns/*', "/profile", "/dashboard"].each do |path|
        before path do
            authentication_error
        end
    end
    
    #index
    get '/dashboard' do
        @user = User.find(current_user.id)

        erb :'users/index'
    end

    #show
    get '/profile' do
        @user = User.find(current_user.id)

        erb :'users/show'
    end

    #new
    get '/signup' do
        #should show options for signup
        erb :'users/new'
    end

    #create
    post '/signup' do
        @user = User.new(firstname: params[:firstname], lastname: params[:lastname], username: params[:username], email: params[:email], password: params[:password])
        if @user.save && @user.valid?
            session[:user_id] = @user.id
            redirect to "/dashboard" 
        else
            flash[:alert] = @user.errors.full_messages
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
            redirect to "/dashboard"
        elsif @user && !@user.authenticate(params[:password])
            flash[:message] = "Password is wrong for that username. Try again."
            redirect to '/login'
        else
            flash[:message] = "Username doesn't exist. Please signup."
            redirect to 'login'
        end
    end



    get '/logout' do
        session.clear
        redirect '/'
    end

    #edit
    get '/profile/edit' do
        @user = User.find(current_user.id)

        erb :'users/edit'
    end

    #update
    patch '/profile' do
        @user = User.find(current_user.id)
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
        @user = User.find(current_user.id)
        @user.delete

        redirect to '/'
    end

end