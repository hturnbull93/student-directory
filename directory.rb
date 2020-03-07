# Array of students
students = [
  { name: 'Dr. Hannibal Lecter', cohort: :november },
  { name: 'Darth Vader', cohort: :november },
  { name: 'Nurse Ratched', cohort: :november },
  { name: 'Michael Corleone', cohort: :november },
  { name: 'Alex DeLarge', cohort: :november },
  { name: 'The Wicked Witch of the West', cohort: :november },
  { name: 'Terminator', cohort: :november },
  { name: 'Freddy Krueger', cohort: :november },
  { name: 'The Joker', cohort: :november },
  { name: 'Joffrey Baratheon', cohort: :november },
  { name: 'Norman Bates', cohort: :november }
]

# print out a header for the list
def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end
# print out the students list 
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
# print out a footer with the number of students
def print_footer(names)
  puts "Overall, we have #{names.length} great students"
end
# get student names from user
def input_students
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  # array for students to be pushed into
  students = []
  # get a name
  name = gets.chomp
  while !name.empty? do
    # push that name as part of a hash to the student array
    students << { name: name, cohort: :november }
    puts "Now we have #{students.length} students"
    # get another name, if user presses enter with no input name is empty, so loop breaks.
    name = gets.chomp
  end
  #return students array implicitly
  students
end

students = input_students
print_header
print(students)
print_footer(students)