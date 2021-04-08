#CLI controller

class StockRecommender::CLI

  def call
    puts "welcome"
    SectorScraper.new
    puts "here's the list"
    Sector.all

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
        i = input.to_i - 1
        # Sector.sector_stocks(i)
        puts "stock"
        puts "stock"
        puts "stock"
        puts "\n Select another sector (1-20), show list (r), exit (e)"
      when 'r'
        Sector.all
        puts "\n Select another sector (1-20), show list (r), exit (e)"
      when 'e'
        break
      else
        puts "error message"
      end
    end

  end

  def goodbye
    puts "Thanks for checking in today. Happy Trading!"
  end
end
