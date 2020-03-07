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
  while i < students.length do
    puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)"
    i += 1
  end
end

# print out students with a certain initial given by user
def print_by_initial_while(students)
  puts 'Which initial would you like list of?'
  initial = gets.chomp
  i = 0
  count = 0
  while i < students.length do
    if students[i][:name][0].downcase == initial.downcase
      puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)"
      count += 1
    end
    i += 1
  end
  puts "There are #{count} students with the initial '#{initial}'"
end

# print out students with name less than 12 characters
def print_under_12_while(students)
  i = 0
  count = 0
  while i < students.length do
    if students[i][:name].length < 12
      puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)"
      count += 1
    end
    i += 1
  end
  puts "There are #{count} students with names less than 12 characters"
end

# get student names from user
def input_students
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  # array of students to be pushed into
  students = []
  # get a name
  name = gets.chomp
  while !name.empty? do
    # push that name as part of a hash to the student array
    students << { name: name, cohort: :november }
    puts "Now we have #{students.length} students"
    # get another name, user presses enter with no input name is empty, so loop breaks.
    name = gets.chomp
  end
  # return students array implicitly
  students
end

students = input_students
print_header
# print_while(students)
# print_by_initial_while(students)
print_under_12_while(students)
print_footer(students)
