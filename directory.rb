# Array of students
students = [
  'Dr. Hannibal Lecter', 
  'Darth Vader', 
  'Nurse Ratched', 
  'Michael Corleone', 
  'Alex DeLarge', 
  'The Wicked Witch of the West', 
  'Terminator', 
  'Freddy Krueger', 
  'The Joker', 
  'Joffrey Baratheon', 
  'Norman Bates'
]

# introduce student list
puts 'The students of Villains Academy'
puts '-------------'
# loop through student array putsing each
students.each do |student|
  puts student
end
# total number of students on one line using string interpolation
puts "Overall, we have #{students.length} great students"
