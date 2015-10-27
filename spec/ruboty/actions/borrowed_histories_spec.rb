require 'spec_helper'

describe Ruboty::CanIBorrow::Actions::BorrowedHistories do
  let(:drscribe_class) { Ruboty::CanIBorrow::Actions::BorrowedHistories }
  let(:drscribe_instance) { drscribe_class.new(message) }
  let(:item) { "SugeeeItem" }
  let(:message) do
    {
      item: "SugeeeItem"
    }
  end
  let(:mock_list) do
    {
      "Batman": {
        user: "Bruce Wayne",
        borrowed_at: (Date.today - 1)
      },
      "Wolverine": {
        user: "Logan",
        borrowed_at: (Date.today)
      }
    }
  end

  describe "#call" do
    context 'is borrowed' do
      before(:each) do
        allow(drscribe_instance).to receive(:leager).and_return mock_list
      end
      it 'reply message' do
        expect(message).to receive(:reply).with(
        [
          "#{mock_list[:Batman][:user]}さんが、#{mock_list[:Batman][:borrowed_at]}にBatmanを借りています。",
          "#{mock_list[:Wolverine][:user]}さんが、#{mock_list[:Wolverine][:borrowed_at]}にWolverineを借りています。",
        ].join("\n")
        )
        drscribe_instance.call
      end
    end
  end
end
