# print out a header for the list
def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

# print out the students list
def print_student_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]}"
    # print_student_data(student)
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
def print_by_initial
  puts 'Which initial would you like list of?'
  initial = gets.chomp
  count = 0
  @students.each_with_index do |student, index|
    if student[:name][0].downcase == initial.downcase
      puts "#{index + 1}. #{student[:name]}"
      print_student_data(student)
      count += 1
    end
  end
  puts "We have #{count} #{count == 1 ? 'student' : 'students'} with the initial '#{initial}'"
end

# print out students with name less than 12 characters
def print_under_12
  count = 0
  @students.each_with_index do |student, index|
    if student[:name].length < 12
      puts "#{index + 1}. #{student[:name]}"
      print_student_data(student)
      count += 1
    end
  end
  puts "We have #{count} #{count == 1 ? 'student' : 'students'} with less than 12 letters in their name"
end

# print students by cohort
def print_by_cohort
  cohorts = []
  @students.each do |student|
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
def print_footer
  puts "Overall, we have #{@students.length} great #{@students.length == 1 ? 'student' : 'students'}"
end

# get student names from user
def input_students
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  # get a name
  name = gets.chomp
  while !name.empty? do
    # ask for cohort
    puts "#{name}'s cohort, default is January"
    cohort = ''
    while cohort == '' do
      input = gets.chomp.downcase
      case input
      when ''
        cohort = :january
      when 'january'
        cohort = :january
      when 'february'
        cohort = :february
      when 'march'
        cohort = :march
      when 'april'
        cohort = :april
      when 'may'
        cohort = :may
      when 'june'
        cohort = :june
      when 'july'
        cohort = :july
      when 'august'
        cohort = :august
      when 'septepmer'
        cohort = :september
      when 'october'
        cohort = :october
      when 'november'
        cohort = :november
      when 'december'
        cohort = :december
      else
        puts 'Month has typo, try again'
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
    @students << { 
      name: name,
      cohort: cohort,
      # hobbies: hobbies,
      # height: height,
      # birth_country: birth_country
    }
    puts "Now we have #{@students.length} #{@students.length == 1 ? 'student' : 'students'}"
    # get next name, if user enters empty string, s.
    name = gets.chomp
  end
  # return students array implicitly
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when '1'
    input_students
  when '2'
    show_students
  when '9'
    exit # terminates program
  else
    puts "I don't know what you meant, try again"
  end
end

@students = []

def interactive_menu
  loop do
    # 1. Print menu
    print_menu
    # get input and action
    process(gets.chomp)
  end
end

interactive_menu
