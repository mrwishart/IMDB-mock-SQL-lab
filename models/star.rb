require_relative('../db/sql_runner')

class Star

  attr_accessor :first_name, :last_name
  attr_reader :id

  def initialize ( options )
    @id = options['id'] if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO stars (first_name, last_name) VALUES ($1, $2) RETURNING id"
    values = [@first_name, @last_name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM stars"
    SqlRunner.run(sql)
  end

  def movies()
    sql = "SELECT movies.*
    FROM movies
    INNER JOIN castings
    ON movies.id = castings.movie_id
    WHERE star_id = $1"
    values = [@id]
    stars = SqlRunner.run(sql, values)
    return stars.map {|star| Movie.new(star)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM stars WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Star.new(result[0])
  end

end
