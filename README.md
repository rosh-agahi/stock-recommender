# Stock::Recommender

Stock Examiner Gem

-A command line interface to review stock performance in multiple market segments.

1. When the app is run, it opens up tradingview.com/markets/stocks-usa and lists out all sectors in the markets
2. the user can select the sector they are interested in viewing the stocks for by typing the number of the sector from the list and hitting enter
3. the app will respond by listing all stocks in the sector.
  - tradingview also shows recommendations for what to do with the stocks
      - "Strong Sell"
      - "Sell"
      - "Neutral"
      - "Buy"
      - "Strong Buy"
  when the app shows the list of stocks in the sector it will only show the ones that have the recommendation for "Strong Buy."

4. The user will then be in the loop to explore any sector or exit the app.

5. when the user exits the app, they will be thanked for visiting.

### Nokogiri and Open-URI to scrape tradingview website

Classes:
- CLI
- SegmentScraper
- StockScraper
- Segment
- Stock

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stock-recommender'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install stock-recommender

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/stock-recommender. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/stock-recommender/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Stock::Recommender project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/stock-recommender/blob/master/CODE_OF_CONDUCT.md).
