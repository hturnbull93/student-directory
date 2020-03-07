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
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]}"
    print_student_data(student)
  end
end

# print out a student's data
def print_student_data(student)
  puts "   - Cohort: #{student[:cohort]}"
  # puts "   - Hobbies: #{student[:hobbies].join(", ")}"
  # puts "   - Height: #{student[:height]}cm"
  # puts "   - Country of birth: #{student[:birth_country]}"
end

# print out students with a certain initial given by user
def print_by_initial(students)
  puts 'Which initial would you like list of?'
  initial = gets.chomp
  count = 0
  students.each_with_index do |student, index|
    if student[:name][0].downcase == initial.downcase
      puts "#{index + 1}. #{student[:name]}"
      print_student_data(student)
      count += 1
    end
  end
  puts "We have #{count} #{count == 1 ? 'student' : 'students'} with the initial '#{initial}'"
end

# print out students with name less than 12 characters
def print_under_12(students)
  count = 0
  students.each_with_index do |student, index|
    if student[:name].length < 12
      puts "#{index + 1}. #{student[:name]}"
      print_student_data(student)
      count += 1
    end
  end
  puts "We have #{count} #{count == 1 ? 'student' : 'students'} with less than 12 letters in their name"
end

# print students by cohort
def print_by_cohort(students)
  cohorts = []
  students.each do |student|
    unless cohorts.include? student[:cohort]
      cohorts << student[:cohort]
    end
  end
  cohorts.each do |month|
    puts "#{month} cohort:"
    students.each_with_index do |student, index|
      if student[:cohort] == month
        puts "#{index + 1}. #{student[:name]}"
        # print_student_data(student)
      end
    end
  end
end

# print out a footer with the number of students
def print_footer(names)
  puts "Overall, we have #{names.length} great #{names.length == 1 ? 'student' : 'students'}"
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
    # ask for cohort
    puts "#{name}'s cohort, default is January"
    cohort = ""
    loop do
      input = gets.chomp.downcase
      case input
      when ""
        cohort = :january
        break
      when "january"
        cohort = :january
        break
      when "february"
        cohort = :february
        break
      when "march"
        cohort = :march
        break
      when "april"
        cohort = :april
        break
      when "may"
        cohort = :may
        break
      when "june"
        cohort = :june
        break
      when "july"
        cohort = :july
        break
      when "august"
        cohort = :august
        break
      when "septepmer"
        cohort = :september
        break
      when "october"
        cohort = :october
        break
      when "november"
        cohort = :november
        break
      when "december"
        cohort = :december
        break
      else
        puts "Month has typo, try again"
      end
    end
    # # ask for hobbies
    # puts "#{name}'s hobbies, comma separated"
    # hobbies = gets.chomp.split(", ")
    # # ask for height
    # puts "#{name}'s height in cm"
    # height = gets.chomp.to_i
    # # ask for country of birth
    # puts "#{name}'s country of birth"
    # birth_country = gets.chomp

    # push data as hash to the student array
    students << { 
      name: name,
      cohort: cohort,
      # hobbies: hobbies,
      # height: height,
      # birth_country: birth_country
    }
    puts "Now we have #{students.length} #{students.length == 1 ? 'student' : 'students'}"
    # get next name, if user enters empty string, loop breaks.
    name = gets.chomp
  end
  # return students array implicitly
  students
end

students = input_students
if students.length > 0
  print_header
  # print(students)
  # print_by_initial(students)
  print_under_12(students)
  # print_by_cohort(students)
  print_footer(students)
else
  puts "No students at Villains Academy"
end
