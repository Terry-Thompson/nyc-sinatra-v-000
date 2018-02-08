class FiguresController < ApplicationController

	get '/figures/new' do
		binding.pry
		erb :'/figures/new'
	end
end
