# ezcater_matchers

This gem contains shared RSpec matchers.

## Installation

Add this line to your application's Gemfile:

```ruby
group :test do
  gem "ezcater_matchers"
end
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ezcater_matchers

## Usage

### Matchers

The matchers included in this gem are:

* **have_been_destroyed**: To check that a model has (or has not) been destroyed.
* **match_ordered_array**: To check that an array has exactly the expected, ordered elements.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then,
run `rake spec` to run the tests. You can also run `bin/console` for an
interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. 

To release a new version, update the version number in `version.rb`, and then
run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to
[Artifactory](https://ezcater.jfrog.io).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/ezcater/ezcater_matchers.
