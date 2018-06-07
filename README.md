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
* **match_db_timestamp**: Compares two timestamps for equality with DB precision (drops nanoseconds).
* **match_models**: Compare an enumerable to an expected list of ActiveRecord model objects (by id/type).
* **match_ordered_array**: To check that an array has exactly the expected, ordered elements.

### Examples

#### match_models

You can use `match_models` to simplify comparing enumerables/ActiveRecord relations to a single expected example:
```
my_model = build(:your_model)

expect(YourModel.scope).to match_models(my_model)
```

You can use `match_models` to compare complex, heterogeneous result lists:

```
caterer = create(:caterer, name: "matches")
brand = create(:caterer, name: "matches")

expect(FullTextSearch.call("matches")).to match_models(caterer, brand)
```

You can also chain the `match_models` matcher to respect/ignore enumerable ordering, which is helpful in combatting flaky tests where order is not 100% deterministic:
```
caterer = create(:caterer, name: "matches")
brand = create(:caterer, name: "matches")

expect(RandomOrderedSearch.call("matches")).to match_models(caterer, brand).unordered
```

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
