require_relative( '../db/sql_runner' )

class Country

  attr_reader :id, :name, :continent_id

  def initialize(options)
    @id = options['id']
    @continent_id = options['continent_id']
    @name = options['name']
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

  def self.list_listed()
    # gives an array of countries whose sights are in the wishlist
    # also eliminates duplicates in the results
    sights = Sight.list_all()
    results = []
    for sight in sights
      countries_already_in_list = results.map { |obj| obj.id }
      country_id = sight.country().id
      if ( countries_already_in_list.include?(country_id) == false )
        country = find_by_id(country_id)
        results.push(country)
      end
    end
    return results
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
    sql = "INSERT INTO countries(continent_id, name) VALUES ($1, $2) RETURNING id"
    values = [@continent_id, @name]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def delete()
    sql = "DELETE from countries where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE countries SET (continent_id, name) = ($1, $2) WHERE id = $3"
    values = [@continent_id, @name, @id]
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

end
