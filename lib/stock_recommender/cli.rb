#CLI controller

class StockRecommender::CLI

  def call
    puts "\nWelcome to the Daily Stock Recommendation App!"
    sleep 1
    SectorScraper.new
    puts "\nHere's today's list of market sectors and how they are performing:\n"
    sleep 1.5
    Sector.display

    menu_loop
    #displays sectors and stocks, requests selection or exit
    goodbye
  end

  def menu_loop
    options

    loop do
    input = gets.chomp
    case input
      when '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12','13', '14', '15', '16', '17', '18', '19', '20'
        i = input.to_i - 1
        s = Sector.select(i)
        puts "\nYou have selected #{s.sec_name}."

        unless Sector.populated?(i)
          StockScraper.new(s.url,s.sec_name)
        end

        buyselloptions

        bso_input = gets.chomp
        Stock.list(s.sec_name,bso_input)
        options
      when 'r'
        Sector.display
        options
      when 'sort'
        Sector.sorted
        options
      when 'easter egg'
        easter_egg
      when 'e'
        break
      else error
      end
    end

  end

  def options
    puts "\nPlease select one of the following and press enter:\n (1-20) Select another sector by typing its index number\n (r)    Show list of sectors\n (sort) Sort sector list by % Daily Change\n (e)    Exit"
  end

  def buyselloptions
    puts "\nPlease select the list you wish to see and press enter:\n (b) 'Strong Buy'  \n (s) 'Strong Sell'"
  end

  def error
    puts "The selection you have made is not valid. Please try again."
  end

  def goodbye
    puts "\n Thanks for checking in today. Happy Trading!"
  end

  def easter_egg
    sleep 2
    puts "\nYou Shall Not Pass!"
    sleep 1
    puts "*whip snap*"
    sleep 1
    gandalf = "Gandalf!".split('')
    for l in gandalf
      putc l
      sleep 0.5
    end
    puts "\nFly you fools!"
    sleep 1
    puts "\n Ok. Now back to our regularly scheduled program."
    sleep 2
    puts "\n"
    Sector.display
    options
  end

end
