# Write a method even_numbers, which takes array as an input, this method should throw error in below conditions
# 1. if array is empty
# 2. if array does not have any even number ( array should include at least one even number )
# 3. if input passed to this method was not an array
# use both inbuilt and custom error classes to throw errors and handle them gracefully. output should be in below format,
# <error class> : <error message>
# The array provided was <array>

#Custom Exception for empty array
class EmptyArrayError < StandardError
  def message
    "array is empty"
  end
end

#custom exception for no even number
class NoEvenNumberError < StandardError
  def message
    "no even number"
  end
end

def even_numbers(array)
  begin
    raise TypeError if array.class != Array
    raise EmptyArrayError if array.empty?
    raise NoEvenNumberError if no_even_number_present? array

  rescue EmptyArrayError =>  exception
    print_error exception

  rescue NoEvenNumberError =>  exception
    print_error exception

  rescue TypeError =>  exception
    print_error exception
  end

end

def no_even_number_present?(array)
  array.select(&:even?).empty?
end

def print_error(exception)
  p "#{exception.class} : #{exception.message}"
end

#not an array
even_numbers("some_string")

#empty array
even_numbers([])

#no even number
even_numbers([1,3])
