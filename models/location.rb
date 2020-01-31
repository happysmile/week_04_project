require_relative( '../db/sql_runner' )

class Location

  attr_reader :id, :name, :location_type, :country_id, :visited

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @location_type = options['location_type']
    @country_id = options['country_id']
    @visited = options['visited'] if options['visited']
  end

  def self.delete_all()
    sql = "DELETE from locations"
    SqlRunner.run(sql)
  end

  def self.list_all()
    sql = "SELECT * from locations"
    results = SqlRunner.run(sql)
    return results.map { |result| Location.new(result) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM locations WHERE id = $1"
    values = [id]
    location = SqlRunner.run(sql, values)[0]
    return Location.new(location)
  end

  def save()
    sql = "INSERT INTO locations(name, location_type, country_id, visited) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @location_type, @country_id, @visited]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def delete()
    sql = "DELETE from locations where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE locations SET (name, location_type, country_id, visited) = ($1, $2, $3) WHERE id = $4"
    values = [@name, @location_type, @country_id, @visited, @id]
    SqlRunner.run( sql, values )
  end

end
