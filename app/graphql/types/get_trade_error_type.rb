
module Types
  class GetTradeErrorType < Types::BaseObject
    field :trade_id, Integer
    field :status_code, Integer
    field :error_message, String
  end
end
