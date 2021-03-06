require_relative( '../db/sql_runner' )

class SightType

  attr_reader :id, :name

  def initialize(options)
    @id = options['id']
    @name = options['name']
  end

  def self.delete_all()
    sql = "DELETE from sight_types"
    SqlRunner.run(sql)
  end

  def self.list_all()
    sql = "SELECT * from sight_types ORDER BY name"
    results = SqlRunner.run(sql)
    return results.map { |result| SightType.new(result) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM sight_types WHERE id = $1"
    values = [id]
    sight_type = SqlRunner.run(sql, values)[0]
    return SightType.new(sight_type)
  end

  def self.find_by_name(name)
    sql = "SELECT * FROM sight_types WHERE name = $1"
    values = [name]
    sight_types = SqlRunner.run(sql, values)
    if sight_types.count() > 0
      return SightType.new(sight_types[0])
    else
      return nil
    end
  end

  def save()
    sql = "INSERT INTO sight_types(name) VALUES ($1) RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def delete()
    sql = "DELETE from sight_types where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE sight_types SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run( sql, values )
  end

  def sights()
    sql = "SELECT * FROM sights WHERE type_id = $1 ORDER BY name"
    values = [@id]
    results = SqlRunner.run(sql, values)
    if ( results.count() > 0 )
      return results.map { |result| Sight.new(result) }
    else
      return nil
    end
  end

end
