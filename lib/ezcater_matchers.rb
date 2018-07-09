# frozen_string_literal: true

require "rspec"

Dir.glob(File.expand_path("ezcater_matchers/*.rb", __dir__)).each { |file| require file }
