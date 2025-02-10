# frozen_string_literal: true

module Types
  class TradeType < Types::BaseObject
    description "The trade resource of this schema"

    field :id, ID
    field :symbol, String, null: true
    field :trade_type, Types::OrderType
    field :quantity, Integer# , null: false
    field :price, Float# , null: false
    field :trade_date, GraphQL::Types::ISO8601DateTime
    field :notes, String
  end
end
