module EzcaterMatchers
  class MismatchedCollectionFailure
    attr_reader :message

    def initialize(actual:, expected:)
      @actual = actual
      @expected = expected
      @message = message_array.join("\n")
    end

    private

    attr_reader :actual, :expected

    def message_array
      [].tap do |messages|
        messages.push(extra_elements_message) if extra_elements.any?
        messages.push(missing_elements_message) if missing_elements.any?
        messages.push(unexpected_order_message) if missing_elements.empty? && extra_elements.empty?
      end
    end

    def extra_elements_message
      "the extra elements were: #{extra_elements}"
    end

    def extra_elements
      @_extra_elements ||= actual - expected
    end

    def missing_elements_message
      "the missing elements were: #{missing_elements}"
    end

    def missing_elements
      @_missing_elements ||= expected - actual
    end

    def unexpected_order_message
      "the elements are not in the expected order"
    end
  end
end
