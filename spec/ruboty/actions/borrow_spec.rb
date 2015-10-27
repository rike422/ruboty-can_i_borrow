require 'spec_helper'

describe Ruboty::CanIBorrow::Actions::Borrow do
  let(:drscribe_class) { Ruboty::CanIBorrow::Actions::Borrow }
  let(:drscribe_instance) { drscribe_class.new(message) }
  let(:item) { "SugeeeItem" }
  let(:message) do
    {
      item: "SugeeeItem"
    }
  end
  describe "#try_borrow" do
    let(:borrowed_at) { Date.today }
    let(:user) { "batman" }
    before(:each) do
      allow(drscribe_instance).to receive(:borrow_history).and_return({
        borrowed_at: borrowed_at,
        user: user
      })
    end
    context 'not borrowed' do
      before(:each) do
        allow(drscribe_instance).to receive(:borrowed?).and_return false
      end
      it 'reply message ' do
        expect(drscribe_instance).to receive(:borrow).once
        expect(message).to receive(:reply).with(
          "#{item}を貸し出し状態にします。"
        )
        drscribe_instance.try_borrow
      end
    end
    context 'is borrowed' do
      before(:each) do
        allow(drscribe_instance).to receive(:borrowed?).and_return true
      end
      it 'reply message' do
        expect(drscribe_instance).to_not receive(:borrow)
        expect(message).to receive(:reply).with(
          "#{item}は#{borrowed_at}に#{user}さんに貸し出されています。"
        )
        drscribe_instance.try_borrow
      end
    end
  end
end
