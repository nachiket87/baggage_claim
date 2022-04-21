# frozen_string_literal: true

require "test_helper"

class BaggageClaimTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::BaggageClaim::VERSION
  end

  def test_it_does_something_useful
    x = BaggageClaim::Classifier.new('united states')
    assert_equal  "American", x.adjectival
  end

  def test_string_method
    assert_equal  "Indian", "India".adjectival
  end
end
