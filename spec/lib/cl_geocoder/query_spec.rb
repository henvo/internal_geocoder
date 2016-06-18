require 'spec_helper'

describe CLGeocoder::Query do

  let(:mixed_query) { '12167 Berlin' }

  describe '#initialize' do
    it 'should create a query object' do
      expect(CLGeocoder::Query.new(mixed_query)).to be_instance_of CLGeocoder::Query
    end
  end
end
