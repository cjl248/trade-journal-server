require "time" # DateTime class is considered deprecated. Use Time class. 'https://rubyapi.org/o/datetime'

class Trade < ApplicationRecord
  after_initialize :init

  # Validations
  # Symbol is the easiest way for a human to identify a trade
  # so we're making sure it's there on save
  validates :symbol, presence: true

  # No need to validate presence of trade_date since it will
  # always have a default

  # Sets enum values and restricts nil on the model level. Numericality
  # option restricts nil values
  enum :trade_type,
  { buy: 0, sell: 1 },
  validate: {
    numericality: { only_numeric: true } # only_numeric attempts to parse the value if it's a String
    # in: (0..1) @TODO: throwing an out of range error for 0, 1
  }

  # Sets the trade_date value to the current UTC time upon saving if it's nil
  def init
    self.trade_date ||= Time.now(in: "+00:00")
  end
end
