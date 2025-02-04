# frozen_string_literal: true

module Types
  class TradeType < Types::BaseObject
    field :id, ID, null: false
    field :symbol, String, null: false
    field :trade_type, Types::OrderType
    field :quantity, Integer
    field :price, Float
    field :trade_date, GraphQL::Types::ISO8601DateTime
    field :notes, String
  end
end
