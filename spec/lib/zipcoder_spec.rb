require 'spec_helper'

describe Zipcoder do
  let(:query) { '10178 Berlin' }

  before { Zipcoder::Location.create!(
    zip_code: '10178',
    city: 'Berlin',
    lat: 1, lon: 2
  )}

  describe '.coordinates' do
    it 'should return a hash' do
      expect(Zipcoder.coordinates(query)).to be_instance_of Hash
    end

    it 'should return a Hash with lat and lon' do
      expect(Zipcoder.coordinates(query)).to include(:lat, :lon)
    end

    it 'should get the correct lat' do
      expect(Zipcoder.coordinates(query)[:lat]).to eql(1)
    end

    it 'should get the correct lon' do
      expect(Zipcoder.coordinates(query)[:lon]).to eql(2)
    end

    context 'when full address is given' do
      it 'should call full address lookup' do
        expect_any_instance_of(Zipcoder::Lookup).to receive(
          :find_by_address
        )
        Zipcoder.coordinates(query)
      end
    end

    context 'when zip_code is given' do
      it 'should call zip_code lookup' do
        expect_any_instance_of(Zipcoder::Lookup).to receive(
          :find_by_zip_code
        )
        Zipcoder.coordinates('12345')
      end
    end

    context 'when city is given' do
      it 'should call city lookup' do
        expect_any_instance_of(Zipcoder::Lookup).to receive(
          :find_by_city
        )
        Zipcoder.coordinates('Paris')
      end
    end
  end
end

