require_relative( '../db/sql_runner' )

class Sight

  attr_reader :id, :name, :location_id, :type_id, :image_url, :visited, :priority

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @location_id = options['location_id']
    @type_id = options['type_id'] if options['type_id']
    @image_url = options['image_url'] if options['image_url']
    @priority = options['priority'] if options['priority']
    @visited = options['visited'] if options['visited']
  end

  def self.delete_all()
    sql = "DELETE from sights"
    SqlRunner.run(sql)
  end

  def self.list_all()
    sql = "SELECT * from sights"
    results = SqlRunner.run(sql)
    return results.map { |result| Sight.new(result) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM sights WHERE id = $1"
    values = [id]
    sight = SqlRunner.run(sql, values)[0]
    return Sight.new(sight)
  end

  def save()
    sql = "INSERT INTO sights(name, location_id, type_id, image_url, priority, visited) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id"
    values = [@name, @location_id, @type_id, @image_url, @priority, @visited]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def delete()
    sql = "DELETE from sights where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE sights SET (name, location_id, type_id, image_url, priority, visited) = ($1, $2, $3, $4, $5, $6) WHERE id = $7"
    values = [@name, @location_id, @type_id, @image_url, @priority, @visited, @id]
    SqlRunner.run( sql, values )
  end

  def location()
    return Location.find_by_id(@location_id)
  end

  def continent()
    sql = "SELECT continents.* FROM continents INNER JOIN countries ON continents.id = countries.continent_id INNER JOIN locations ON countries.id = locations.country_id WHERE locations.id = $1"
    values = [@location_id]
    continents = SqlRunner.run(sql, values)
    return continents[0]
  end

  def country()
    sql = "SELECT countries.* FROM countries INNER JOIN locations ON countries.id = locations.country_id WHERE locations.id = $1"
    values = [@location_id]
    countries = SqlRunner.run(sql, values)
    return countries[0]
  end

  def other_sights_in_same_location()
    sql = "SELECT * FROM sights WHERE location_id = $1 AND NOT id = $2"
    values = [@location_id, @id]
    results = SqlRunner.run(sql, values)
    return results.map { |result| Sight.new(result) }
  end

  def other_sights_in_same_country()
    country_id = country()['id']
    p country_id
    sql = "SELECT DISTINCT sights.* FROM sights INNER JOIN locations ON locations.country_id = $1 WHERE  NOT sights.id = $2"
    values = [country_id, @id]
    results = SqlRunner.run(sql, values)
    return results.map { |result| Sight.new(result) }
  end

  def same_type_same_country()
    other_sights = other_sights_in_same_country()
    return other_sights.select {|sight| (sight.type_id == @type_id)}
  end

  def type()
    return SightType.find_by_id(@type_id)
  end

  def tick_off()
    @visited = true
    update()
    location = location()
    location.tick_off()
    country = country()
    country.tick_off()
  end

end
