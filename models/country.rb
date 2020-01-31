require_relative( '../db/sql_runner' )

class Country

  attr_reader :id, :name, :continent_id, :visited

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @continent_id = options['continent_id']
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

  def save()
    sql = "INSERT INTO countries(name, continent_id) VALUES ($1, $2) RETURNING id"
    values = [@name, @continent_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def delete()
    sql = "DELETE from countries where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE countries SET (name, continent_id) = ($1, $2) WHERE id = $2"
    values = [@name, @continent_id, @id]
    SqlRunner.run( sql, values )
  end

end
