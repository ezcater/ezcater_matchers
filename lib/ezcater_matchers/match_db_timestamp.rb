# Compare one or more ActiveRecord database Timestamp values, with db precision (drops nanoseconds)
RSpec::Matchers.define :match_db_timestamp do |expected|
  match do |actual|
    expect(db_precision(actual)).to eq(db_precision(expected))
  end

  failure_message do |actual|
    "expected #{debug_timestamp(db_precision(actual))} to match #{debug_timestamp(db_precision(expected))}"
  end

  def db_precision(timestamp)
    timestamp.change(nsec: 0)
  end

  def debug_timestamp(timestamp)
    "#{timestamp} (#{timestamp.to_f})"
  end
end
