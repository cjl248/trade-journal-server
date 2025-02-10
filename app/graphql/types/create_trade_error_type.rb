
module Types
  class CreateTradeErrorType < Types::BaseObject
    field :status_code, Integer
    field :error_message, String
  end
end
