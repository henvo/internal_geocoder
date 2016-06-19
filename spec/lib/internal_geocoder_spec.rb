require 'spec_helper'

describe InternalGeocoder do
  let(:query) { '10178 Berlin' }

  describe '.coordinates' do
    it 'should return a hash' do
      expect(InternalGeocoder.coordinates(query)).to be_instance_of Hash
    end

    it 'should return a Hash with lat and lon' do
      expect(InternalGeocoder.coordinates(query)).to include(:lat, :lon)
    end
  end
end

