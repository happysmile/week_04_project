require_relative( '../db/sql_runner' )

class Country

  attr_reader :id, :name, :continent_id, :visited

  def initialize(options)
    @id = options['id']
    @continent_id = options['continent_id']
    @name = options['name']
    @visited = options['visited'] if options['visited']
  end

  def self.delete_all()
    sql = "DELETE from countries"
    SqlRunner.run(sql)
  end

  def self.list_all()
    sql = "SELECT * from countries"
    results = SqlRunner.run(sql)
    return results.map { |result| Country.new(result) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM countries WHERE id = $1"
    values = [id]
    country = SqlRunner.run(sql, values)[0]
    return Country.new(country)
  end

  def self.find_by(column, value)
    sql = "SELECT * FROM countries WHERE #{column} = $1"
    values = [value]
    results = SqlRunner.run(sql, values)
    return results.map { |result| Country.new(result) }
  end

  def save()
    sql = "INSERT INTO countries(continent_id, name, visited) VALUES ($1, $2, $3) RETURNING id"
    values = [@continent_id, @name, @visited]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def delete()
    sql = "DELETE from countries where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE countries SET (continent_id, name, visited) = ($1, $2, $3) WHERE id = $4"
    values = [@continent_id, @name, @visited, @id]
    SqlRunner.run( sql, values )
  end

  def continent()
    return Continent.find_by_id(@continent_id)
  end

  def locations()
    sql = "SELECT * FROM locations WHERE country_id = $1"
    values = [@id]
    results = SqlRunner.run( sql, values )
    return results.map { |result| Location.new(result) }
  end

  def sights()
    sql = "SELECT sights.* FROM sights INNER JOIN locations ON sights.location_id = locations.id WHERE locations.country_id = $1"
    values = [@id]
    results = SqlRunner.run( sql, values )
    return results.map { |result| Sight.new(result) }
  end

  def tick_off()
    @visited = true
    update()
  end

end
