class FiguresController < ApplicationController

  get '/figures' do 
		erb :'/figures/index'
	end


	get '/figures/new' do
		@titles = Title.all
		@landmarks = Landmark.all
		erb :'/figures/new'
	end

end
