class DonationController < ApplicationController

    get '/campaigns/:id/donate' do
        @campaign = Campaign.find(params[:id])

        erb :'/donations/new'
    end

    post '/campaigns/:id/donate' do
        @donation = Donation.new
        @donation.amount = params[:amount]
        @donation.message = params[:message]
        @donation.donor_id = current_user.id
        @donation.campaign_id = params[:id]
        @donation.save
        
        redirect to '/donations/success'
    end

    get '/dashboard/success' do
        
        erb :'donations/success'
    end

end