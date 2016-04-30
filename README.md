# *"They are, my lord, without the palace gate."*

## About

RandomShakespeare gives you absolutely random quotes from Macbeth.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'random_shakespeare'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install random_shakespeare

## Usage

```ruby
require 'random_shakespeare'
random_shakespeare #=> "Hey, it's a random quote!"
```

Note that for the first run, you need internet access to download [Macbeth xml file](https://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml).

## About

I wrote this for practice, I realize it's rather useless. I am happy with the test suite though. Feedback is welcome, as always.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/matildasmeds/random_shakespeare.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

