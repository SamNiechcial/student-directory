def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student has to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
# Method below is for 8.1:
  #  students.each.with_index(1) do |student, index|
  #    puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort)"
  #  end
# Method below is for 8.2:
# (Calling .chr on a string returns the first charcter as another string)
  # students.each do |student|
  #  if student[:name].chr == "S"
  #    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  #  end
  # end
# Method below is for 8.3:
# (Calling .length on a string returns the number of characters in that string as an integer)
  # students.each do |student|
  # if student[:name].length < 12
  #   puts "#{student[:name]} (#{student[:cohort]} cohort)"
  # end
  #end
# Method below is for 8.4:
# ()
  counter = 0
  until counter == students.count do
    puts "#{students[counter][:name]} (#{students[counter][:cohort]} cohort)"
    counter += 1
  end
end


def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
# it's important that print() doesn't add new line characters
# New lines can be added manually to print commands like so:
# print "line1\nline2\nline3"
# These \n escape characters need to be in double quotes!
