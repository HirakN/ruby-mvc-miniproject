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
		erb :"sharks/index"
	end

	# New
	get "/sharks/new" do 

	end

	# Show
	get "sharks/:id" do
		id = params[:id].to_i

		@shark = Shark.find id

		erb :"sharks/show"
	end

	# Edit


	# Update


	# Create


	# Delete



end