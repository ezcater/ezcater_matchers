# frozen_string_literal: true

RSpec.describe EzcaterMatchers::MismatchedCollectionFailure do
  describe "#message" do
    it "reports unexpected order" do
      message = described_class.new(actual: [], expected: []).message

      expect(message).to eq("the elements are not in the expected order")
    end

    it "reports the extra elements" do
      message = described_class.new(actual: [1], expected: []).message

      expect(message).to eq("the extra elements were: [1]")
    end

    it "reports the missing elements" do
      message = described_class.new(actual: [], expected: [1]).message

      expect(message).to eq("the missing elements were: [1]")
    end

    it "adds newlines between messages" do
      message = described_class.new(actual: [1], expected: [2]).message

      expect(message).to match(/extra.+\n.+missing/)
    end
  end
end
