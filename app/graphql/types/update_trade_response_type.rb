module Types
  class UpdateTradeResponseType < Types::BaseUnion
    description "Objects which may be returned from a request to update a trade "
    possible_types Types::UpdateTradeSuccessType, Types::UpdateTradeErrorType
    def self.resolve_type(object, context)
      if object.is_a?(ActiveRecord::RecordNotFound) || !!object
        Types::UpdateTradeErrorType
      else
        Types::UpdateTradeSuccessType
      end
    end
  end
end
