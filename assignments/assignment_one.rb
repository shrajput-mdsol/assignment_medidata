# Assignment:
# Write a ruby code to convert a given array into a hash which includes keys as identifiers of each array element and print the expected paragraph.
# participant = ['John Doe', '20', 'Male']
# Expected Output:
# Hash should look like below,
# {:first_name=>"John", :last_name=>"Doe", :age=>20, :gender=>"Male"}
# Dear Mr/Ms John Doe,
# Thanks for your participation in this clinical trial. Below are your captured details,
# First Name: John
# Last Name: Doe
# Age: 20
# Gender: Male


#SOLUTION:
#Given is the array
participant = ['John Doe', '20', 'Male']

hash = {}
#Assigning array elements as hash values
hash[:first_name] = participant[0].split[0]
hash[:last_name] = participant[0].split[1]
hash[:age] = participant[1]
hash[:gender] = participant[2]

puts hash

#Print the paragraph
print "Dear Mr/Ms #{hash[:first_name]},\n\nThanks for your participation in this clinical trial. Below are your
captured details,\n\nFirst Name: #{hash[:first_name]}\nLast Name: #{hash[:last_name]}\nAge: #{hash[:age]}\nGender:
#{hash[:gender]}"
