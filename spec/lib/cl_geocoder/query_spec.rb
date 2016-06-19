require 'spec_helper'

describe CLGeocoder::Query do

  let(:mixed) { '12167 Berlin' }
  let(:zip_code) { '22113' }
  let(:city) { 'Bad Homburg' }

  describe '#initialize' do
    it 'should create a query object with text' do
      expect(CLGeocoder::Query.new(mixed).to_s).to eq(mixed)
    end
  end

  describe '#zip_code_query?' do
    it 'should detect a zip_code query' do
      expect(CLGeocoder::Query.new(zip_code).zip_code_query?).to be_truthy
    end

    it 'should be false with non zip code query' do
      expect(CLGeocoder::Query.new(mixed).zip_code_query?).to be_falsy
    end
  end

  describe '#city_query?' do
    it 'should detect a city query' do
      expect(CLGeocoder::Query.new(city).city_query?).to be_truthy
    end

    it 'should be false with non city query' do
      expect(CLGeocoder::Query.new(mixed).city_query?).to be_falsy
    end
  end
end
