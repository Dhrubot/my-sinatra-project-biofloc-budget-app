class CampaignController < ApplicationController

    #index
    get '/campaigns' do
        @campaigns = Campaign.all

        erb :'/campaigns/index'
    end

    #new

    get '/campaigns/new' do

        erb :'/campaigns/new'
    end

    #create
    post '/campaigns' do
        # raise params.inspect
        @campaign = Campaign.new
        @campaign.title = params[:title]
        @campaign.description = params[:description]
        @campaign.goal_amount = params[:goal_amount]
        @campaign.save

        redirect to "/campaigns/#{@campaign.id}"
    end

    #edit
    get '/campaigns/:id/edit' do
        @campaign = Campaign.find(params[:id])

        erb :'/campaigns/edit'
    end

    #show
    get '/campaigns/:id' do
        @campaign = Campaign.find(params[:id])

        erb :'/campaigns/show'
    end

    #update
    patch '/campaigns/:id' do
        @campaign = Campaign.find(params[:id])
        @campaign.update(title: params[:title], description: params[:description], goal_amount: params[:goal_amount])

        redirect to "/campaigns/#{@campaign.id}"
    end

    #destroy
    delete '/campaigns/:id' do
        @campaign = Campaign.find(params[:id])
        @campaign.delete

        redirect to '/campaigns'
    end

end