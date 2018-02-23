class FiguresController < ApplicationController

  get '/figures' do 
		erb :'/figures/index'
	end


	get '/figures/new' do
		@titles = Title.all
		@landmarks = Landmark.all
		erb :'/figures/new'
	end


	get '/figures/:id' do 
		@figure = Figure.find(params[:id])
		erb :'/figures/show'
	end


	get '/figures/:id/edit' do 
		@figure = Figure.find(params[:id])
		erb :'/figures/edit'
	end


	post '/figures' do
		@figure = Figure.find_or_create_by(name: params[:figure][:name])
		Helper.check_entries(params,@figure)
		erb :'/figures/show'
	end


	post '/figures/:id' do 
		@figure = Figure.find(params[:id])
		Helper.check_entries(params,@figure)
		redirect :"/figures/#{@figure.id}"	
	end

end# of class
