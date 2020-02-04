require_relative( '../db/sql_runner' )

class Location

  attr_reader :id, :name, :location_type, :country_id

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @location_type = options['location_type'] if options['location_type']
    @country_id = options['country_id']
  end

  def self.delete_all()
    sql = "DELETE from locations"
    SqlRunner.run(sql)
  end

  def self.list_all()
    sql = "SELECT * from locations ORDER BY name"
    results = SqlRunner.run(sql)
    return results.map { |result| Location.new(result) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM locations WHERE id = $1"
    values = [id]
    location = SqlRunner.run(sql, values)[0]
    return Location.new(location)
  end

  def self.find_by_name(name)
    sql = "SELECT * FROM locations WHERE name = $1"
    values = [name]
    locations = SqlRunner.run(sql, values)
    if locations.count() > 0
      return Location.new(locations[0])
    else
      return nil
    end
  end

  def save()
    sql = "INSERT INTO locations(name, location_type, country_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @location_type, @country_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def delete()
    sql = "DELETE from locations where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE locations SET (name, location_type, country_id) = ($1, $2, $3) WHERE id = $4"
    values = [@name, @location_type, @country_id, @id]
    SqlRunner.run( sql, values )
  end

  def country()
    return Country.find_by_id(@country_id)
  end

  def sights()
    sql = "SELECT * from sights WHERE sights.location_id = $1 ORDER BY name"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |result| Sight.new(result) }
  end

end
