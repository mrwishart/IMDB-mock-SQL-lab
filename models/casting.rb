require_relative('../db/sql_runner')

class Casting

  attr_accessor :movie_id, :star_id, :fee
  attr_reader :id

  def initialize ( options )
    @id = options['id'] if options['id']
    @movie_id = options[ 'movie_id']
    @star_id = options[ 'star_id']
    @fee = options['fee'].to_i
  end

  def save()
    sql = "INSERT INTO castings (movie_id, star_id, fee) VALUES ($1, $2, $3) RETURNING id"
    values = [@movie_id, @star_id, @fee]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM castings"
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM castings WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Casting.new(result[0])
  end

end
