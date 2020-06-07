class ApplicationController < Sinatra::Base
    use Rack::Flash, :sweep => true

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

    get '/about' do
        erb :about
    end

    helpers do 

        def logged_in?
            !!current_user 
        end

        def current_user
            @user ||= User.find(session[:user_id]) if session[:user_id]
        end

        def authentication_error
            if !logged_in?
                flash[:notice] = "You must Log In or Sign Up to proceed!"
                redirect to '/login'
            end
        end
    end 

end