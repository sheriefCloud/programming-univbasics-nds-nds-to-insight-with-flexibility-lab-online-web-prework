# Provided, don't edit
require 'directors_database'
require 'pry'
# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  {
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection) #PASSED
  array = []
  movie_index = 0
  while movie_index < movies_collection.size do
    array << movie_with_director_name(name,movies_collection[movie_index])
    movie_index += 1
  end
  array
end #PASSED


def gross_per_studio(collection)
  studios_gross = {}

  index = 0
  while index < collection.size do
	c_movie = collection[index]
	c_studio = c_movie[:studio]
	c_movie_gross = c_movie[:worldwide_gross]

      if !studios_gross[c_studio]
        puts "DidNot Find IT"
        studios_gross[c_studio] = c_movie_gross
			else
        puts "FOUND IT and the current values are #{studios_gross}"
				studios_gross[c_studio] += c_movie_gross
      puts "after running the routine #{studios_gross}"
			end

	index += 1
studios_gross

end


  def movies_with_directors_set(source)
  array = []
  level1_index = 0

  while level1_index < source.size.do
	movie_array = []
	director_name = source[level1_index][:name]
	movies_coll = source[level1_index][:movies]
	movie_array << movie_with_director_key(director_name,movies_coll)

	level1_index += 1

  end

  array
end



# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
