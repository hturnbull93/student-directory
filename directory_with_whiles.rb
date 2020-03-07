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

# print out a footer with the number of students
def print_footer(names)
  puts "Overall, we have #{names.length} great students"
end

##### WHILE LOOPS INSTEAD OF EACH METHODS

# print out the students list
def print_while(students)
  i = 0
  while i < students.length {
    puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)"
    i += 1
  }
end

# print out students with a certain initial given by user
def print_by_initial_while(students)
  puts 'Which initial would you like list of?'
  initial = gets.chomp
  i = 0
  count = 0
  while i < students.length do
    if students[i][:name][0].downcase == initial.downcase
      puts "#{index + 1}. #{student[i][:name]} (#{student[i][:cohort]} cohort)"
      count += 1
    end
    i += 1
  end
  puts "There are #{count} students with the initial '#{initial}'"
end

# print out students with name less than 12 characters
def print_under_12_while(students)
  count = 0
  students.each_with_index do |student, index|
    if student[:name].length < 12
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
      count += 1
    end
  end
  puts "There are #{count} students with names less than 12 characters"
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
  # return students array implicitly
  students
end

students = input_students
print_header
# print(students)
# print_by_initial(students)
# print_under_12(students)
# print_while(students)
print_by_initial_while(students)
print_footer(students)
