require_relative( '../db/sql_runner' )

class Sight

  attr_reader :id, :name, :location_type, :country_id, :visited

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @location_id = options['location_id']
    @sight_type_id = options['sight_type_id'] if options['sight_type_id']
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
    sql = "INSERT INTO sights(name, location_type, country_id, visited) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @location_type, @country_id, @visited]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def delete()
    sql = "DELETE from sights where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE sights SET (name, location_type, country_id, visited) = ($1, $2, $3) WHERE id = $4"
    values = [@name, @location_type, @country_id, @visited, @id]
    SqlRunner.run( sql, values )
  end

end
