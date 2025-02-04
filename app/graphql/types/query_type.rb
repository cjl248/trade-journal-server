# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :trades,
      [ Types::TradeType ],
      null: false,
      description: "Return a list of all trades"

    def trades
      Trade.all
    end
  end
end
