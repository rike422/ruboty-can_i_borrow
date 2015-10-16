require 'spec_helper'

describe Ruboty::CanIBorrow::Actions::Return do
  let(:drscribe_class) { Ruboty::CanIBorrow::Actions::Return }
  let(:drscribe_instance) { drscribe_class.new(message) }
  let(:item) { "SugeeeItem" }
  let(:message) do
    {
      item: "SugeeeItem"
    }
  end
  describe "#try_return" do
    let(:borrowed_at) { Date.today }
    let(:user) { "batman" }
    before(:each) do
      allow(drscribe_instance).to receive(:borrow_history).and_return({
        borrowed_at: borrowed_at,
        user: user
      })
    end
    context 'history is empty' do
      before(:each) do
        allow(drscribe_instance).to receive(:borrow_history).and_return nil
      end
      it 'reply message' do
        expect(message).to receive(:reply).with(
          "#{item}は借しだされていません。"
        )
        drscribe_instance.try_return
      end
    end
    context 'is borrower' do
      before(:each) do
        allow(drscribe_instance).to receive(:borrower?).and_return true
      end
      it 'reply message' do
        expect(drscribe_instance).to receive(:return_item).once
        expect(message).to receive(:reply).with(
          "#{item}を返却済みにします。ありがとうございました。"
        )
        drscribe_instance.try_return
      end
    end
    context 'not borrower' do
      before(:each) do
        allow(drscribe_instance).to receive(:borrower?).and_return false
      end

      it 'reply message' do
        expect(drscribe_instance).to_not receive(:return_item)
        expect(message).to receive(:reply).with("#{item}は#{user}さんによって借りられています。")
        drscribe_instance.try_return
      end
    end
  end
end
