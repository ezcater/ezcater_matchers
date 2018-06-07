# frozen_string_literal: true

# Compare one or more ActiveRecord models to an enumerable of actual results
# Error messages display friendly output of `ModelClass-id` tuples for debugging
RSpec::Matchers.define :match_models do |*expected| # rubocop:disable Metrics/BlockLength
  @comparator = :equality

  match do |actual|
    case @comparator
    when :set
      expect(actual_models(actual).to_set).to eq(expected_models(expected).to_set)
    else
      expect(actual_models(actual)).to eq(expected_models(expected))
    end
  end

  failure_message do |actual|
    "expected #{expected_models(expected).inspect} but got #{actual_models(actual)}"
  end

  chain :ordered do
    @comparator = :equality
  end

  chain :unordered do
    @comparator = :set
  end

  def actual_models(actual_array)
    actual_array.to_a.map { |obj| object_name(obj) }
  end

  def expected_models(expected_array)
    expected_array.map { |obj| object_name(obj) }
  end

  def object_name(obj)
    "#{obj.class.name}-#{obj.id}"
  end
end
