require 'spec_helper'

describe Ruboty::CanIBorrow::Actions::Base do
  let(:drscribe_class) { Ruboty::CanIBorrow::Actions::Base }
  let(:drscribe_instance) { drscribe_class.new(message) }
  let(:message) do
    {
      item: "SugeeeItem"
    }
  end
  let(:user) { 'Wolverine' }
  let(:other_user) { 'Batman' }

  describe '#borrowed?' do
    subject { drscribe_instance.borrowed? }
    before(:each) do
      allow(drscribe_instance).to receive(:borrow_history).and_return(history)
    end
    context 'history' do
      let(:history) { {} }
      it { is_expected.to be_truthy }
    end
    context 'no history' do
      let(:history) { nil }
      it { is_expected.to be_falsy }
    end
  end

  describe '#borrower?' do
    subject { drscribe_instance.borrower? }
    let(:history_user) { user }
    let(:request_user) { user }
    before(:each) do
      allow(drscribe_instance).to receive(:borrow_history).and_return({ user: history_user })
      allow(message).to receive(:from_name).and_return(request_user)
    end
    context 'match user' do
      it { is_expected.to be_truthy }
    end
    context 'missmatch user' do
      let(:request_user) { other_user }
      it { is_expected.to be_falsey }
    end
  end

  describe '#item' do
    subject { drscribe_instance.item }
    it { is_expected.to eq "SugeeeItem" }
  end
end
