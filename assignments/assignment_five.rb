# Assignment for today :bananadance::peanuts_dancer:
#              4:56
#              Create a Person class which have attribute accessors for name , age and gender
#              Handle the methods set_name, set_age and set_gender such that it calls name , age , gender respectively and returns the appropriate results.
#                Make your code as reusable as it can get.
#                  The code should work fine if we add more attribute accessors to the class in future
#              Expected output
#              p= Person.new
#              p.name = “chris”
#              p.age = 35
#              p.name #chris
#              p.age #35
#              p.set_name = “Adam”
#              p.set_age = 36
#              p.name #Adam
#              P.age #36

#SOLUTION
class Person
  attr_accessor :name, :age, :gender

  def method_missing(m, *args, &block)
    test = /set_(.*)/.match(m)
    unless test[1].empty?
      self.method(test[1]).call args[0]
    else
      super
    end
  end
end

pr = Person.new
#pr.set_
pr.set_name = 'Adam'
p pr.name #Adam
pr.name = 'Aman'
p pr.name #Aman
pr.set_   #`method_missing': undefined method `set_' for #<Person:0x00007f9ee68eac88> (NoMethodError)
