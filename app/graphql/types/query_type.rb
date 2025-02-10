# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    description "The query root of this schema"

    # include GraphQL::Types::Relay::HasNodeField
    # include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :trades,
    [ Types::TradeType ],
    null: false,
    description: "Return a list of all trades"

    field :trade,
    Types::GetTradeResponseType,
    null: true,
    description: "Returns the trade with the given id if it exists, otherwise an error" do
      argument :id, ID, required: true
    end

    def trades
      Trade.all
    end

    def trade(id:)
      id_to_find = id.to_i
      trade = Trade.find_by(id: id_to_find)
      return {
        trade_id: id_to_find,
        status_code: 404,
        error_message: "record with id: #{id_to_find} does not exist"
      } if trade.nil?
      trade
    end
  end
end
