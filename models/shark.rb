class Shark
	attr_accessor :id, :name, :length, :species, :habitat, :status

	def save
		conn = Shark.open_connection

		# If object doesnt have an id (so doesnt exist in db)
		if(!self.id) 
			# Insert a new record in to the database
			sql = "INSERT INTO sharks (name, length, species, habitat, status) VALUES ( '#{self.name}', #{self.length}, '#{self.species}', '#{self.habitat}', '#{self.status}')"
		else 
			# Update an existing one
			sql = "UPDATE sharks SET name='#{self.name}', length= #{self.length}, species ='#{self.species}', habitat ='#{self.habitat}', status ='#{self.status}' WHERE id = #{self.id}"
		end

		conn.exec(sql)

	end

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

	def self.destroy id

		conn = self.open_connection

		# Delete entry where passed in parameter is the id
		sql = "DELETE FROM sharks where id = #{id}"

		conn.exec(sql)

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