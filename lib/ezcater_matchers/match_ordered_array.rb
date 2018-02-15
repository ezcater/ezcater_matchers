require "ezcater_matchers/mismatched_collection_failure"

RSpec::Matchers.define :match_ordered_array do |expected|
  match do |actual|
    actual == expected
  end

  failure_message do |actual|
    EzcaterMatchers::MismatchedCollectionFailure.
      new(actual: actual, expected: expected).
      message
  end
end
