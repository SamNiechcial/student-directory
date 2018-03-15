def input_students

  students = []
  puts "Please enter the student details"

  puts "What is the name of the student?"
  name = gets.chomp
  puts "Which cohort is the student in?"
  cohort = gets.chomp
  if cohort = nil
    cohort = "March"
  end
  puts "Where was the student born?"
  country = gets.chomp
  puts "What is the student's height?"
  height = gets.chomp
  puts "What are the student's hobbies?"
  hobbies = gets.chomp

  while true do

    students << {name: name, cohort: cohort, country: country, height: height, hobbies: hobbies}

    puts "Now we have #{students.count} students"

    puts "Did you make any errors with your last entry?"
    error = gets.chomp
    if error == "Yes"
      students.pop
      puts "Please re-enter the student data"
    else
      true
    end

    puts "Do you wish to stop? Enter 'Yes' to stop or 'No' to enter another student's details:"
    stop = gets.chomp
    stop == "Yes" ? break : true

    puts "What is the name of the student?"
    name = gets.chomp
    puts "Which cohort is the student in?"
    cohort = gets.chomp
    if cohort = nil
      cohort = "March"
    end
    puts "Where was the student born?"
    country = gets.chomp
    puts "What is the student's height?"
    height = gets.chomp
    puts "What are the student's hobbies?"
    hobbies = gets.chomp

  end

  # below line returns the array of students as output of the input_students method

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
# (When referencing from a subhash inside an array, can just put the array indices square brackets next to the hash key square brackets)
# ( I.e. puts "#{array_name[array_index][hash_key]}" )
#  counter = 0
#  until counter == students.count do
#    puts "#{students[counter][:name]} (#{students[counter][:cohort]} cohort)"
#    counter += 1
#  end

# Method below is for 8.5:
# (Loop from 8.1 modified to include extra student data)

students.each.with_index(1) do |student, index|
    puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort) (born in #{student[:country]}) (height: #{student[:height]}) (Enjoys #{student[:hobbies]})".center(220)
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
