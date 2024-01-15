module Serpapi
  module Currencies
    SYMBOLS = {
      '$' => 'USD',
      '€' => 'EUR'
    }.freeze

    def self.[](currency)
      SYMBOLS[currency] || 'EUR'
    end
  end
end
