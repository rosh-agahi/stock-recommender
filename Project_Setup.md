1. use bundler to create the skeleton of the cli application<br>
  `bundle gem stock-recommender`

2. added notes re the project to the README

3. added the executable file **stock-recommender** to the bin folder

4. set up the executable file. in bin, added "stock-recommender". included shebang `#!/usr/bin/env ruby` to ensure that the file uses ruby  
- added executable function using chmod
- `cd bin/` --> cd to the bin directory
- `ls -lah` --> shows the permissions
<br> *-rw-r--r--   1 ragahi  staff    41B Apr  7 19:32 stock-recommender*
- `chmod +x stock-recommender`
 --> this adds the executable function to this file.
  <br> *-rwxr-xr-x   1 ragahi  staff    41B Apr  7 19:32 stock-recommender*
  <br>Allows the computer permissions to execute the file through the ruby interpreter on my behalf.

5. in the executable file added a reference to call a new instance of the cli class.
* need to require the cli class file in the executable file.

**to run the app, `cd` into the stock-recommender directory, run:**<br>`./bin/stock-recommender`

6. set up the interface loop in the cli class
- welcomes the user
- provides a list of all stock segments
- lets the user pick a stock segment to see the stock data
- lets the user pick another segment, go back to the list, or exit
  - there are 20 segments. will error out if a number other than 1-20 is selected.
- upon exit, thanks the user for using the app.

7. set up segment scraper class
  - uses nokogiri
  - site = https://www.tradingview.com/markets/stocks-usa/sectorandindustry-sector/

  -scraper collects:
  /:site/ --> this is the site above
  /:doc/ --> creates a doc for nokogiri
  /:sector/ --> the website displays the segments in a table. each sector has it's own table row.
    - within each sector, the scraper collects to following to create the display table for the app:
        - name--> becomes :sec_name
        - url --> becomes :url (the name of each of the sectors already links to the sector's own page.)
        - percent change --> becomes :sec_change


8. set up segment class

  - segment has:
  /:sec_name/ --> name of the segment (aka sector --"sec")

  /:url/ --> in tradingview when you click on each of the segments, you are directed to the segment's page where the stocks are listed. this generates the url based on the segment name so that the stocks can be scraped.

  /:sec_change/ --> percentage change from the prior day in value of the segment

  /:namelength/ --> calculated field. length of the segment name; used to create proper spacing in the displayed table

  /:stocks/ --> starts as empty array. list of stocks in the segment. filled in by the stock scraper which visits the segment's own url and scrapes the stocks.

9. added 7 and 8 to the required files in the environment file

10. rewrote the interface user input options in a more DRY method called options.
added the option to sort the sectors in the table. still need the code to sort by daily change.

11. modified the method to sort the segment list by % daily change.
sorted_list = @@all.sort_by(&:sec_change).reverse
self.display(sorted_list)
can still return to alphabetical list by selecting (r) return or (sort) for sorted list

12. github not working...
at the start of the project, set up a local git repo.
set up a repository on github with the same name
* was using the ssh config. changed the https and it worked.
* couldn't tell because of dark mode. :facepalm:

13. set up stock scraper class
**Add requiring Stock and StockScraper to stock_recommender.rb file**

Stock Scraper initializes with a given url from the Sector `Sector[i].url`
* uses Nokogiri to visit the site and scrape the following data
  * each row in the url table of stocks.




14. set up stock class

Second to last step:
will need to go through and match all segment/sector... pick one.

last step:
clean up the interface.
