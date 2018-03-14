## let's put all the students into an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffery Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
# it's important that print() doesn't add new line characters
# New lines can be added manually to print commands like so:
# print "line1\nline2\nline3"
# These \n escape characters need to be in double quotes!
