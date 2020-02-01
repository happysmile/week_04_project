require_relative( '../db/sql_runner' )

class Continent

  attr_reader :id, :name

  def initialize(options)
    @id = options['id']
    @name = options['name']
  end

  def self.delete_all()
    sql = "DELETE from continents"
    SqlRunner.run(sql)
  end

  def self.list_all()
    sql = "SELECT * from continents"
    results = SqlRunner.run(sql)
    return results.map { |result| Continent.new(result) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM continents WHERE id = $1"
    values = [id]
    continent = SqlRunner.run(sql, values)[0]
    return Continent.new(continent)
  end

  def save()
    sql = "INSERT INTO continents(name) VALUES ($1) RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def delete()
    sql = "DELETE from continents where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE continents SET (name) = ($1) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run( sql, values )
  end

  def countries()
    sql = "select * from countries WHERE continent_id = $1"
    values = [@id]
    results = SqlRunner.run( sql, values )
    return results.map { |result| Country.new(result) }
  end
  
end
