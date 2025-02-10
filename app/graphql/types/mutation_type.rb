# frozen_string_literal: true

require_relative "base_argument.rb"

module Types
  class MutationType < Types::BaseObject
    # FIELDS

    field :create_trade,
    CreateTradeResponseType,
    description: "creates a new trade" do
      argument :symbol, String, required: true
      argument :trade_type, Types::OrderType, required: true
      argument :quantity, Integer, required: true, default_value: 0, replace_null_with_default: true
      argument :price, Float, required: true
      argument :trade_date,
      GraphQL::Types::ISO8601DateTime,
      required: false,
      default_value: nil,
      replace_null_with_default: true
      argument :notes,
      String,
      required: false,
      default_value: nil,
      replace_null_with_default: true
    end

    field :update_trade,
    UpdateTradeResponseType,
    description: "updates an existing trade" do
      argument :id, ID, required: true
      argument :symbol, String, required: false
      argument :trade_type, Types::OrderType, required: false
      argument :quantity, Integer, required: false
      argument :price, Float, required: false
      argument :trade_date, GraphQL::Types::ISO8601DateTime, required: false
      argument :notes, String, required: false
    end

    field :delete_trade,
    GraphQL::Types::Boolean,
    description: "deletes a trade" do
      argument :id, ID, required: true
    end

    # RESOLVERS

    def create_trade(arguments)
      begin
        Trade.create!(arguments)
      rescue ActiveRecord::RecordInvalid
        { status_code: 422, error_message: "record with arguments: #{arguments} is invalid" }
      end
    end

    def update_trade(arguments)
      begin
        trade_to_update = Trade.find(arguments[:id].to_i)
      rescue ActiveRecord::RecordNotFound
        { status_code: 404, error_message: "record with id: #{arguments[:id]} not found." }
      else
        success = trade_to_update.update(arguments)
        return { status_code: 200, message: "update successful" } if success
        { status_code: 400, error_message: "record with arguments: #{arguments} is invalid" }
      end
    end

    def delete_trade(id:)
      id_to_delete = id.to_i
      begin
        Trade.destroy(id_to_delete)
      rescue ActiveRecord::RecordNotFound
        false
      end
    end
  end
end
