# Create you own split method of ruby which apes the following 3 functionalities of the inbuilt split ruby method.:exploding_head: :awesome_dance:
#   1. If nothing is given, the string is splitted on witespace and returned. :bananadance:
#   2.6.6 :035 > "Medidata".split
# => ["Medidata"]
# 2.6.6 :039 > "M e d i d a t a".split
# => ["M", "e", "d", "i", "d", "a", "t", "a"]
# 2. If only delimiter is given, the string is splitted on delimiter and returned.:bananadance:
#   2.6.6 :051 > "M e d i * d a t a".split("*")
# => ["M e d i ", " d a t a"]
# 3. If both delimiter and block are given, the string is splitted on delimter and the block code is run for each element but the reciever is returned.:bananadance:
#   2.6.6 :047 > "M e d i d a t a".split {|i| p i.upcase }
# "M"
# "E"
# "D"
# "I"
# "D"
# "A"
# "T"
# "A"
# => "M e d i d a t a"

#SOLUTION
class String
  def split(delimeter = " ")
    str = self
    #Base Condition
    index = str.index(delimeter)
    return str if index.nil?

    #Recursive Call
    arr = Array.new
    arr << str.slice(0, index) << str.slice(index + 1, length).split(delimeter)

    #Handling Block
    arr.flatten!
    arr.each_index { |i| yield arr[i]} if block_given?
    return arr
  end
end

str = "Medidata"
p str.split
str2 = "Medi*data"
p str2.split("*")
p str2.split("*") {|i| puts i.upcase}
