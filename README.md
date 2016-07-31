# CtaTrack

Description coming

## Ruby Gems 

[Project on rubygems.org](https://rubygems.org/gems/cta_track)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cta_track'
```

And then execute:

    $ bundle
    # needed to run tests 
    $ touch config.yml
    $ echo API_KEY: YOUR_API_KEY_HERE >> config.yml

Or install it yourself as:

    $ gem install cta_track

## Usage

Basic usage: 

`CtaTrack::API.apikey = [YOUR API KEY]` 

`CtaTrack::API.vehicles(:routes=>[78, 82]) # returns Nokogiri::xml document of buses on 82 and 78 routes`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/rdalin82/cta_track/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
