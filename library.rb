require_relative "openings"

class Library
  def initialize
    @openings = []
  end

  def run
    loop do
      puts "\n"
      puts "Welcome to the Chess Openings Library!"
      puts "1. Add an opening line"
      puts "2. List all openings"
      puts "3. Select a specific opening"
      puts "4. Exit"
      print "Choose an option: "
      option = gets.chomp.to_i
      puts "\n"
      case option
      when 1
        add_opening
      when 2
        list_openings
      when 3
        find_opening
      when 4
        puts "Thank you for using the openings library. Goodluck!"
        break
      else
        puts "Invalid option. Please try again."
      end
    end
  end

  def add_opening
    print "Enter opening name: "
    name = gets.chomp
    print "Is this opening played by black or white: "
    color = gets.chomp
    print "Enter the move order: "
    move_order = gets.chomp
    @openings << Opening.new(name, move_order, color)
    puts "Opening added."
  end

  def list_openings
    if @openings.count <= 0
      puts "There aren't any openings in the library. Please add an opening."
    else
      puts "All openings:"
        @openings.each do |opening|
        puts opening
        end
    end
  end

  def find_opening_by_name(name)
    @openings.find { |opening| opening.name == name}
  end

  def find_opening
    print "Enter opening name: "
    opening_name = gets.chomp
    puts find_opening_by_name(opening_name)
  end
end
