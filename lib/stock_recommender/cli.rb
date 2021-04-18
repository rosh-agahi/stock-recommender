#CLI controller

class StockRecommender::CLI

  def call
    puts "Welcome to the Daily Stock Recommendation App!"
    sleep 1
    SectorScraper.new
    puts "Here's today's list of market sectors and how they are performing:"
    sleep 1
    Sector.display

    menu_loop
    #displays sectors, requests selection or exit
    goodbye
  end

  def menu_loop
    puts "Please select a sector (1-20) by typing the number corresponding to it and pressing enter."
    puts "If you would like to exit, type e and press enter."

    loop do
    input = gets.chomp
    case input
      when '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12','13', '14', '15', '16', '17', '18', '19', '20'
        valid_index_input(input)
      when 'r'
        Sector.display
        options
      when 'sort'
        Sector.sorted
        puts "\nPlease note when list is sorted by %change, you must resort alphabetically by pressing 'r' before selecting a sector to explore.\nYou may still press 'e' at this time to exit."
      when 'easter egg'
        easter_egg
      when 'e'
        break
      else
        puts "error message"
      end
    end

  end

  def valid_index_input(input)
    i = input.to_i - 1
    selectedsector = Sector.showname(i)
    puts "You chose #{selectedsector}."
    options2
    buy_or_sell_loop
  end


  def buy_or_sell_loop
    # #if Sector.populated?(index) == FALSE
    # # StockScraper.new()
    input2 = ""
    while input2 != "r"
      input2 = gets.chomp
      if input2 == "b" || input2 == "s"
        puts input2
      elsif input2 == "e"
        input2 = "r"
      else puts "error"
      end
    end
    Sector.display
    options
  end

  def options
    puts "\n Please select another sector (1-20), show list (r), sort list by % Daily Change (sort), exit (e)"
  end

  def options2
    puts "\n Please enter the list you wish to see either 'Strong Buy' (b) | 'Strong Sell' (s) | return to list (r)."
  end

  def goodbye
    puts "Thanks for checking in today. Happy Trading!"
  end

  def easter_egg
    sleep 2
    puts "\nYou Shall Not Pass!"
    sleep 1
    puts "*whip snap*"
    sleep 1
    gandalf = ['G','a','n','d','a','l','f','!']
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
