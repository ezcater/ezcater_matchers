# frozen_string_literal: true

RSpec.describe "matched_ordered_array matcher" do # rubocop:disable RSpec/DescribeClass
  it "asserts on array order" do
    actual = [1, 2]

    expect(actual).to match_ordered_array([1, 2])
  end
end
