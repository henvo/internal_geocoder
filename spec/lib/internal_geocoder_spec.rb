require 'spec_helper'

describe InternalGeocoder do
  let(:query) { '10178 Berlin' }

  before { InternalGeocoder::Location.create!(
    zip_code: '10178',
    city: 'Berlin',
    lat: 1, lon: 2
  )}

  describe '.coordinates' do
    it 'should return a hash' do
      expect(InternalGeocoder.coordinates(query)).to be_instance_of Hash
    end

    it 'should return a Hash with lat and lon' do
      expect(InternalGeocoder.coordinates(query)).to include(:lat, :lon)
    end

    it 'should get the correct lat' do
      expect(InternalGeocoder.coordinates(query)[:lat]).to eql(1)
    end

    it 'should get the correct lon' do
      expect(InternalGeocoder.coordinates(query)[:lon]).to eql(2)
    end

    context 'when full address is given' do
      it 'should call full address lookup' do
        expect_any_instance_of(InternalGeocoder::Lookup).to receive(
          :find_by_address
        )
        InternalGeocoder.coordinates(query)
      end
    end
  end
end

