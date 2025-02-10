require "time" # DateTime class is considered deprecated. Use Time class. 'https://rubyapi.org/o/datetime'

class Trade < ApplicationRecord
  # Easily readable. Allows a descriptive method name. Easier to add more
  # methods to this hook in the future.
  after_initialize :update_trade_date

  # Worse: harder to read and maintain if more methods are added to this
  # hook in the future
  # after_initialize -> { self.trade_date ||= Time.now(in: "+00:00") }

  # Validations
  # • No need to validate trade_date. #update_trade_date
  # ensures it's present
  # • Symbol is the easiest way for a human to identify a trade.
  # Make sure it's there on save. Also restricted on database
  # level with null constraint
  validates :symbol, presence: true

  # Sets enum values and restricts nil on the model level. Numericality
  # option restricts nil values
  enum :trade_type,
  { buy: 0, sell: 1 },
  validate: {
    # only_numeric attempts to parse the value if it's a String
    numericality: {
      only_integer: true,
      in: (0..1)
    },
    message: "trade_type value was %{value} but must be the integer 0 or 1"
  }

  # Used to find a workable value from #price
  def value
    self.price.to_f
  end

  private

    # Sets the trade_date value to the current UTC time upon saving if it's nil
    def update_trade_date
      self.trade_date ||= Time.now(in: "+00:00")
    end
end
