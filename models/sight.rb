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
    sql = "SELECT * from sights ORDER BY name"
    results = SqlRunner.run(sql)
    return results.map { |result| Sight.new(result) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM sights WHERE id = $1"
    values = [id]
    sight = SqlRunner.run(sql, values)[0]
    return Sight.new(sight)
  end

  def self.find_by_name(name)
    sql = "SELECT * FROM sights WHERE name = $1"
    values = [name]
    if (SqlRunner.run(sql, values).count() > 0)
      sight = SqlRunner.run(sql, values)[0]
      return Sight.new(sight)
    else
      return nil
    end
  end

  def self.search(params)
    sql = "SELECT * FROM sights"
    if (params.values.any? { |value| value != '' } )
      first_not_empty = params.values.find{ |value| value != '' }
      sql += " WHERE "
        if (params[:name] != '')
          sql += "name LIKE '%#{params[:name]}%'"
        elsif (params[:type_id] != '')
          if (params[:type_id] != first_not_empty)
            sql += " AND "
          end
          sql += "type_id = #{params[:type_id]}"
        elsif (params[:location_id] != '')
          if (params[:location_id] != first_not_empty)
            sql += " AND "
          end
          sql += "location_id = #{params[:location_id]}"
        # elsif (params[:priority] != '')
        #   if (params[:priority] != first_not_empty)
        #     sql += " AND "
        #   end
        # #   sql += "priority = #{params[:priority]}"
        # elsif (params[:visited] != '')
        #   if (params[:visited] != first_not_empty)
        #     sql += " AND "
        #   end
        #   sql += "visited = #{params[:visited]}"
        end
    end
    sql += " ORDER BY name;"
    results = SqlRunner.run(sql)
    return results.map { |result| Sight.new(result) }
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
    results = SqlRunner.run(sql, values)
    continents = results.map { |result| Continent.new(result) }
    return continents[0]
  end

  def country()
    sql = "SELECT countries.* FROM countries INNER JOIN locations ON countries.id = locations.country_id WHERE locations.id = $1"
    values = [@location_id]
    results = SqlRunner.run(sql, values)
    countries = results.map { |result| Country.new(result) }
    return countries[0]
  end

  def other_sights_in_same_location()
    sql = "SELECT * FROM sights WHERE location_id = $1 AND NOT id = $2 ORDER BY name"
    values = [@location_id, @id]
    results = SqlRunner.run(sql, values)
    return results.map { |result| Sight.new(result) }
  end

  def other_sights_in_same_country()
    country_id = country()['id']
    sql = "SELECT DISTINCT sights.* FROM sights INNER JOIN locations ON locations.country_id = $1 WHERE  NOT sights.id = $2 ORDER BY name"
    values = [country_id, @id]
    results = SqlRunner.run(sql, values)
    return results.map { |result| Sight.new(result) }
  end

  def same_type()
    sql = "SELECT * FROM sights WHERE type_id = $1 ORDER BY name"
    values = [@type_id]
    results = SqlRunner.run(sql, values)
    return results.map { |result| Sight.new(result) }
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
