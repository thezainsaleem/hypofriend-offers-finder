# frozen_string_literal: true

require_relative "offersfinder/version"
require "httparty"

# Hyporfrien New Offers API parser
module Offersfinder
  include HTTParty
  BASE_URI = "https://offer-v3.hypofriend.de"
  ERROR_RESPONSES = {
    invalid_params: {
      offers: [],
      message: "Invalid Parameters"
    },
    parsing_error: {
      offers: [],
      message: "Parsing Error, Contact Author"
    }
  }.freeze

  def self.new_offer(loan_amount: 0, property_value: 0, repayment: 0.0, years_fixed: 0)
    response = HTTParty.get("#{BASE_URI}/api/v5/new-offers.json",
                            { query: { loan_amount: loan_amount, property_value: property_value, repayment: repayment,
                                       years_fixed: years_fixed } })
    handle_response(response)
  end

  def self.handle_response(response)
    return ERROR_RESPONSES[:invalid_params] if response.code != 200

    begin
      body = JSON.parse(response.body)
    rescue StandardError => _e
      return ERROR_RESPONSES[:parsing_error]
    end
    {
      offers: body["data"]["offers"]
    }
  end

  class Error < StandardError; end
end
