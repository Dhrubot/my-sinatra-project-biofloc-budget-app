class DonationController < ApplicationController


    get '/campaigns/:id/donate/success' do

        erb :'donations/success'
    end

    #new
    get '/campaigns/:id/donate' do
        @campaign = Campaign.find(params[:id])

        erb :'/donations/new'
    end

    #create
    post '/campaigns/:id/donate' do
        @donation = Donation.new
        @donation.amount = params[:amount]
        @donation.message = params[:message]
        @donation.donor_id = current_user.id
        @donation.campaign_id = params[:id]
        @donation.save
        
        redirect to '/campaigns/:id/donate/success'
    end


end