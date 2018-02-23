class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

	module Helper

		def self.check_entries(params, instance)
				title_ids = params.first[1][:title_ids]
				landmark_ids = params.first[1][:landmark_ids]
				new_landmark = params[:new_landmark]
				instance.name = params.first[1][:name]

					title_ids.each {|id| instance.titles << Title.find(id)} if title_ids

					landmark_ids.each {|id| instance.landmarks << Landmark.find(id)} if landmark_ids

					instance.landmarks << Landmark.create(name: new_landmark) if new_landmark
				

				if params[:title] && !params[:title][:name].empty?
					instance.titles << Title.find_or_create_by(name: params[:title][:name])
				end

				if params[:landmark] && !params[:landmark][:name].empty?
					instance.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
				end

			instance.save
		end

	end


end
