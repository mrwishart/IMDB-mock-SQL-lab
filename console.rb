require_relative('./models/movie')
require_relative('./models/star')
require_relative('./models/casting')

require('pp')

Movie.delete_all()
Star.delete_all()
Casting.delete_all()

movie1 = Movie.new({'title' => 'Good Will Hunting', 'genre' => 'drama', 'budget' => 30_000_000})
movie2 = Movie.new({'title' => 'Full Metal Jacket', 'genre' => 'war drama', 'budget' => 40_000_000})
movie3 = Movie.new({'title' => 'The Shape Of Water', 'genre' => 'fish romance', 'budget' => 20_000_000})
movie4 = Movie.new({'title' => 'Forrest Gump', 'genre' => 'heartwarming drama', 'budget' => 15_000_000})
movie5 = Movie.new({'title' => 'Top Gun', 'genre' => 'aircraft porn', 'budget' => 10_000_000})
movie6 = Movie.new({'title' => 'Vanilla Sky', 'genre' => 'sci-fi', 'budget' => 25_000_000})

movie1.save()
movie2.save()
movie3.save()
movie4.save()
movie5.save()
movie6.save()


star1 = Star.new({'first_name' => 'Robin', 'last_name' => 'Williams'})
star2 = Star.new({'first_name' => 'Tom', 'last_name' => 'Cruise'})
star3 = Star.new({'first_name' => 'Jennifer', 'last_name' => 'Lawrence'})
star4 = Star.new({'first_name' => 'Tom', 'last_name' => 'Hanks'})

star1.save()
star2.save()
star3.save()
star4.save()


casting1 = Casting.new({'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => 2_300_000})

casting2 = Casting.new({'movie_id' => movie4.id, 'star_id' => star4.id, 'fee' => 1_500_000})

casting3 = Casting.new({'movie_id' => movie1.id, 'star_id' => star2.id, 'fee' => 250_000})

casting4 = Casting.new({'movie_id' => movie1.id, 'star_id' => star3.id, 'fee' => 7_500_000})

casting5 = Casting.new({'movie_id' => movie5.id, 'star_id' => star2.id, 'fee' => 8_500_000})

casting6 = Casting.new({'movie_id' => movie6.id, 'star_id' => star2.id, 'fee' => 8_500_000})

casting1.save()
casting2.save()
casting3.save()
casting4.save()
casting5.save()
casting6.save()

# pp movie1.stars
# pp star2.movies

pp movie1.final_budget
