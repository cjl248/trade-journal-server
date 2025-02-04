require 'time'

Trade.destroy_all

trades = [
  {
    symbol: 'SPY',
    trade_type: 1,
    quantity: 1000,
    price: 597.77,
    trade_date: Time.utc(year = 2024, month = 11, mday = 2, hour = 3, min = 16, sec = 34),
    notes: 'part of s&p500 indexes'
  },
  {
    symbol: 'VOO',
    trade_type: 1,
    quantity: 1000,
    price: 549.70,
    trade_date: nil,
    notes: 'to diversify s&p500 indexes'
  },
  {
    symbol: 'WMT',
    trade_type: 0,
    quantity: 300,
    price: 99.54,
    trade_date: nil,
    notes: nil
  },
  {
    symbol: 'DIS',
    trade_type: 1,
    quantity: 200,
    price: 114.00,
    trade_date: Time.new('2024-12-11 16:39:45'),
    notes: 'remember to place a limit sell order on this one'
  }
]

trades.map { |trade| Trade.find_or_create_by!(trade) }
