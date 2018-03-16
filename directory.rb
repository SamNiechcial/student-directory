def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
      when "1"
        students = input_students(students)
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
      end
  end
end

def input_students(students)

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
    name = gets.chomp
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
    end
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
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

interactive_menu
