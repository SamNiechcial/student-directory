## let's put all the students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffery Baratheon",
  "Norman Bates"
]
# and then print them
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
  puts student
end
# finally, we print the total
print "Overall, we have #{students.count} great students"

# it's important that print() doesn't add new line characters
# New lines can be added manually to print commands like so:
# print "line1\nline2\nline3"
# These \n escape characters need to be in double quotes!
