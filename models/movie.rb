require_relative('../db/sql_runner')
require_relative('./star')
require_relative('./casting')

class Movie

  attr_accessor :title, :genre
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @budget = options['budget'].to_i
  end

  def save()
    sql = "INSERT INTO movies (title, genre, budget) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @budget]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def stars()
    sql = "SELECT stars.*
    FROM stars
    INNER JOIN castings
    ON stars.id = castings.star_id
    WHERE movie_id = $1"
    values = [@id]
    stars = SqlRunner.run(sql, values)
    return stars.map {|star| Star.new(star)}
  end

  def final_budget
    total_fees = castings.reduce(0) {|total, casting| total + casting.fee}
    return @budget - total_fees
  end

  def castings
    sql = "SELECT * FROM castings WHERE movie_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|casting| Casting.new(casting)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM movies WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Movie.new(result[0])
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end


end
