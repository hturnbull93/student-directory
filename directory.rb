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

    # push data as hash to the student array
    @students << { name: name, cohort: cohort, }
    puts "Now we have #{@students.length} #{@students.length == 1 ? 'student' : 'students'}"
    # get next name, if user enters empty string, s.
    name = gets.chomp
  end
end

def print_menu
  puts '1. Input the students'
  puts '2. Show the students'
  puts '3. Save student data to csv'
  puts '4. Load student data from csv'
  puts '9. Exit'
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
  when '3'
    save_students
  when '4'
    load_students
  when '9'
    exit # terminates program
  else
    puts "I don't know what you meant, try again"
  end
end

def save_students
  # open file to write to
  file = File.open("students.csv", "w")
  # iterate through students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open('students.csv', 'r')
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def interactive_menu
  loop do
    # 1. Print menu
    print_menu
    # get input and action
    process(gets.chomp)
  end
end

interactive_menu
