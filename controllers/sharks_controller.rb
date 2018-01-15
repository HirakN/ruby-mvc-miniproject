class SharksController < Sinatra::Base

	set :root, File.join(File.dirname(__FILE__), '..')

	# sets the view directory correctly
	set :views, Proc.new { File.join(root, "views") }

	# Turn on Sinatra Reloader
	configure :development do
		register Sinatra::Reloader
	end

	# Index
	get "/sharks" do
		@title = "Home"

		@sharks = Shark.all
		# binding.pry
		erb :"/sharks/index"
	end

	# New
	get "/sharks/new" do 
		@title = "New"

		erb :"/sharks/new"
	end

	# Create
	post "/sharks" do
		shark = Shark.new

		shark.name = params[:name]
		shark.length = params[:length]
		shark.species = params[:species]
		shark.habitat = params[:habitat]
		shark.status = params[:status]

		shark.save

		redirect("/sharks")
	end

	# Show
	get "/sharks/:id" do
		id = params[:id].to_i

		@shark = Shark.find id

		@title = @shark.name

		erb :"/sharks/show"
	end

	# Edit
	get "/sharks/:id/edit" do
		id = params[:id]

		@shark = Shark.find id

		erb :"/sharks/edit"
	end

	# Update
	put "/sharks/:id" do
		id = params[:id]

		shark = Shark.find id

		shark.name = params[:name]
		shark.length = params[:length]
		shark.species = params[:species]
		shark.habitat = params[:habitat]
		shark.status = params[:status]

		shark.save
		redirect("/sharks")
	end

	# Delete
	delete "/sharks/:id" do
		id = params[:id]

		Shark.destroy id

		redirect("/sharks")
	end

end