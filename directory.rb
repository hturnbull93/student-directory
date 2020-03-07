@students = []

# print out a header for the list
def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

# print out the students list
def print_student_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# print out a footer with the number of students
def print_footer
  puts "Overall, we have #{@students.length} great #{@students.length == 1 ? 'student' : 'students'}"
end

# enter student name and info
def enter_student_info
  name = STDIN.gets.chomp
  while !name.empty? do
    cohort = enter_student_cohort
    add_student(name, cohort)
    puts "Now we have #{@students.length} #{@students.length == 1 ? 'student' : 'students'}"
    name = STDIN.gets.chomp
  end
end

# ask for cohort of student
def enter_student_cohort
  puts 'Enter cohort, default is January'
  cohort = ''
  months = %w[january february march april may june july august september october november december]
  while cohort == '' do
    input = STDIN.gets.chomp.downcase
    if months.include?(input)
      return input
    elsif input == ''
      return 'january'
    else
      puts 'Month has typo, try again'
    end
  end
end

# get student names from user
def input_students
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  enter_student_info
end

def add_student(name, cohort)
  @students << { name: name, cohort: cohort.to_sym }
end

def show_students
  if @students.length > 0
    print_header
    print_student_list
    print_footer
  else
    puts 'We have no students'
  end
end

def save_students
  puts 'Which file to save to?'
  target = STDIN.gets.chomp
  file = File.open(target, 'w')
  # iterate through students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(',')
    file.puts csv_line
  end
  file.close
  puts "Students saved to #{target}"
end

def load_students(filename = 'students.csv')
  file = File.open(filename, 'r')
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_student(name, cohort)
  end
  file.close
  puts "Students loaded from #{filename}"
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    filename = 'students.csv'
  end
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.length} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
  end
end

def clear_students
  puts 'Are you sure you want to clear student data? Unsaved data will be lost. (Y/n)'
  input = STDIN.gets.chomp
  if input == 'Y'
    @students = []
    puts 'Student data cleared'
  else
    puts 'Student data not cleared'
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts '1. Input the students'
  puts '2. Show the students'
  puts '3. Save student data to csv'
  puts '4. Load student data from csv'
  puts '5. Clear student data'
  puts '9. Exit'
end

def process(selection)
  case selection
  when '1'
    input_students
  when '2'
    show_students
  when '3'
    save_students
  when '4'
    load_students
  when '5'
    clear_students
  when '9'
    exit # terminates program
  else
    puts "I don't know what you meant, try again"
  end
end

try_load_students
interactive_menu
