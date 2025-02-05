require 'rails_helper'

RSpec.describe Trade, type: :model do
  # Will hold all future create tests
  context "when creating trades " do
    describe "correctly handles trade_date when saving" do
      let(:trade) { Trade.create!(symbol: 'TSLA', trade_type: 1, trade_date:) }
      it "sets trade_date if it does not have a value" do
        expect(trade.trade_date).not_to be_nil
        expect(trade.errors).to be_empty
      end

      let(:trade_date) { Time.new('2024-11-11 06:19:54') }
      it "does not overwrite trade_date if it already has a value" do
        expect(trade.trade_date).to eq(trade_date)
      end
    end
  end

  # Will hold all future new tests
  # context "when initializing trades " do; end

  describe "trade_type enum validations" do
    let(:trade) { described_class }
    it {
      should define_enum_for(:trade_type).with_values({
        buy: 0, sell: 1
      }).backed_by_column_of_type(:integer)
    }

    let(:trade) { Trade.new(symbol: "SYM") }
    it "should display the correct error message with an invalid enum value" do
      expect {
         trade.save!
      }.to raise_error(an_instance_of(ActiveRecord::RecordInvalid).and having_attributes(
        message: "Validation failed: Trade type trade_type value was  but must be the integer 0 or 1"
      ))
    end
  end
end
