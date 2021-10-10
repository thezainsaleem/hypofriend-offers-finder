# frozen_string_literal: true

require "test_helper"

class OffersfinderTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Offersfinder::VERSION
  end

  def test_no_params
    response = Offersfinder.new_offer()
    assert_empty(response[:offers])
    assert_equal response[:message], Offersfinder::ERROR_RESPONSES[:invalid_params][:message]
  end

  def test_invalid_params
    response = Offersfinder.new_offer(loan_amount: "test_invalid_params")
    assert_empty(response[:offers])
    assert_equal response[:message], Offersfinder::ERROR_RESPONSES[:invalid_params][:message]
  end

  def test_valid_params
    response = Offersfinder.new_offer(loan_amount: 35000, property_value: 350000, repayment: 1.0, years_fixed: 15)
    refute_empty(response[:offers])
    assert_nil response[:message]
  end
end
