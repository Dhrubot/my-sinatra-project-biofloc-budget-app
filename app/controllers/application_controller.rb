class ApplicationController < Sinatra::Base

    configure do 
        set :public_folder, 'public'
        set :views, './app/views'
        enable :sessions
        set :session_secret, "myApp2316"
    end

    get '/' do
        # Selects a random camapign
        @featured_campaign = Campaign.order(Arel.sql('RANDOM()')).first

        erb :welcome
    end

    helpers do 

        def logged_in?
            !!current_user 
        end

        def current_user
            @user ||= User.find(session[:user_id]) if session[:user_id]
        end
    end 

end