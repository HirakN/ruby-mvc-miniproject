class Shark
	attr_accessor :id, :name, :length, :species, :habitat, :status

	def self.open_connection
		conn = PG.connect( dbname: 'blog')
	end

	def self.all
		conn = self.open_connection

		sql = "SELECT * FROM sharks ORDER BY id"

		# Returns array of hashes
		results = conn.exec(sql)

		# Go through each hash in the array
		sharks = results.map do |shark| 
			self.hydrate(shark)
		end

		sharks
	end

	def self.find id

	    conn = self.open_connection

	    sql = "SELECT * FROM sharks WHERE id = #{id} LIMIT 1"

	    sharks = conn.exec(sql)

	    # hydrate the shark from the query, still in array
	    shark = self.hydrate sharks[0]

	    shark

	end

	def self.hydrate data
		shark = Shark.new

		shark.id = data['id']
		shark.name = data['name']
		shark.length = data['length']
		shark.species = data['species']
		shark.habitat = data['habitat']
		shark.status = data['status']

		shark
	end


end