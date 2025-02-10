module Types
  class CreateTradeResponseType < Types::BaseUnion
    description "Objects which may be returned from a request to create a trade "
    possible_types Types::TradeType, Types::CreateTradeErrorType
    def self.resolve_type(object, context)
      if object.is_a?(Trade)
        Types::TradeType
      else
        Types::CreateTradeErrorType
      end
    end
  end
end
