def input_students

  students = []
  puts "Please enter the student details"

  while true do

    puts "Do you wish to stop? Enter 'Yes' to stop or anything else to enter another student's details:"
    stop = gets.chomp
    if stop == "Yes" && students.length == 0
      puts "Student List not printed as no students have been entered"
      exit
    elsif stop == "Yes" && students.length != 0
      break
    end

    puts "What is the name of the student?"
# Exercise 10 -> Chop is an alternative method to call on str with a similar output
# .chomp is safer as it doesn't change the string if it doesn't end in a record separator
    name = gets.chop
    puts "Which cohort is the student in?"
    cohort = gets.chomp
    puts "Where was the student born?"
    if cohort == ""
      cohort = "March"
    end
    country = gets.chomp
    puts "What is the student's height?"
    height = gets.chomp
    puts "What are the student's hobbies?"
    hobbies = gets.chomp

    students << {name: name, cohort: cohort, country: country, height: height, hobbies: hobbies}

    puts "Now we have #{students.count} students"

    puts "Did you make any errors with your last entry? Enter 'Yes' if so, or anything else if not:"
    error = gets.chomp
    if error == "Yes"
      discard = students.pop
      puts "Please re-enter the student data"
    else
      true
    end

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

#  students.each.with_index(1) do |student, index|
#    puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort) (born in #{student[:country]}) (height: #{student[:height]}) (Enjoys #{student[:hobbies]})".center(220)
#  end
#end

# Method below is for 8.8:
# (Calling .sort_by! on an array sorts that array by the value specified)
  sorted = students.sort_by! { |student_sort| student_sort[:cohort]}
  sorted.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort) (born in #{student[:country]}) (height: #{student[:height]}) (Enjoys #{student[:hobbies]})".center(220)
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student"
  else
    puts "Overall, we have #{students.count} great students"
  end
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
