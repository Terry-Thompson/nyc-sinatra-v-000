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
		title_ids = params[:figure][:title_ids]
		landmark_ids = params[:figure][:landmark_ids]

		if title_ids
			title_ids.each {|id| @figure.titles << Title.find(id)}
		elsif landmark_ids 
			landmark_ids.each {|id| @figure.landmarks << Landmark.find(id)}
		elsif !params[:title][:name].empty? 
			@figure.titles << Title.find_or_create_by(name: params[:title][:name])  
		elsif !params[:landmark][:name].empty? 
			@landmark = Landmark.find_or_create_by(name: params[:landmark][:name])  
			@figure.landmarks << @landmark 
			@landmark.save
		end# of if 

		@figure.save		
		erb :'/figures/show'
	end# of post '/figures'


end# of class
