require 'spec_helper'

describe Ruboty::CanIBorrow do

  let(:robot) do
    Ruboty::Robot.new
  end

  it 'has a version number' do
    expect(Ruboty::CanIBorrow::VERSION).not_to be "0.1.1"
  end
end
