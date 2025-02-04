module Types
  class GetTradeResponseType < Types::BaseUnion
    description "Objects which may be returned from a request for a single trade "
    possible_types Types::TradeType, Types::GetTradeErrorType

    def self.resolve_type(object, context)
      if object.is_a?(Trade)
        Types::TradeType
      else
        Types::GetTradeErrorType
      end
    end
  end
end
