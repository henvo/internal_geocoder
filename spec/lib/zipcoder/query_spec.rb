require 'spec_helper'

describe Zipcoder::Query do

  let(:address) { '12167 Berlin' }
  let(:zip_code) { '22113' }
  let(:city) { 'Bad Homburg' }

  describe '#initialize' do
    it 'should create a query object with text' do
      expect(Zipcoder::Query.new(address).to_s).to eq(address)
    end
  end

  describe '#zip_code_query?' do
    it 'should detect a zip_code query' do
      expect(Zipcoder::Query.new(zip_code).zip_code_query?).to be_truthy
    end

    it 'should be false with non zip code query' do
      expect(Zipcoder::Query.new(address).zip_code_query?).to be_falsy
    end
  end

  describe '#city_query?' do
    it 'should detect a city query' do
      expect(Zipcoder::Query.new(city).city_query?).to be_truthy
    end

    it 'should be false with non city query' do
      expect(Zipcoder::Query.new(address).city_query?).to be_falsy
    end
  end

  describe '#address_query?' do
    it 'should detect a full address query' do
      expect(Zipcoder::Query.new(address).address_query?).to be_truthy
    end

    it 'should be false with non city query' do
      expect(Zipcoder::Query.new(city).address_query?).to be_falsy
    end
  end
end
