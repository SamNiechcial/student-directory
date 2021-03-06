@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def input_students

  puts "Please enter the student details"

  while true do

    puts "Do you wish to stop? Enter 'Yes' to stop, or anything else to enter another student's details:"
    stop = STDIN.gets.chomp
    if stop == "Yes" && @students.length == 0
      puts "Student List not printed as no students have been entered"
      exit
    elsif stop == "Yes" && @students.length != 0
      break
    end

    puts "What is the name of the student?"
    name = STDIN.gets.chomp
    puts "Which cohort is the student in?"
    cohort = STDIN.gets.chomp
    if cohort == ""
      cohort = "March"
    end
    puts "Which country was the student born in?"
    country = STDIN.gets.chomp
    puts "What is the student's height?"
    height = STDIN.gets.chomp
    puts "What are the student's hobbies?"
    hobbies = STDIN.gets.chomp

    @students << {name: name, cohort: cohort, country: country, height: height, hobbies: hobbies}

    puts "Now we have #{@students.count} students"

    puts "Did you make any errors with your last entry? Enter 'Yes' if so, or anything else if not:"
    error = STDIN.gets.chomp
    if error == "Yes"
      discard = @students.pop
      puts "Please enter the student data again now"
    end
  end
  @students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  sorted = @students.sort_by! { |student_sort| student_sort[:cohort]}
  sorted.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort) (born in #{student[:country]}) (height: #{student[:height]}) (Enjoys #{student[:hobbies]})".center(220)
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:country], student[:height], student[:hobbies]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, country, height, hobbies = line.chomp.split(',')
    @students << {name: name.to_sym, cohort: cohort.to_sym, country: country.to_sym, height: height.to_sym, hobbies: hobbies.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
