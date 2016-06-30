require 'spec_helper'

describe Zipcoder::Lookup do
  let(:lookup) { Zipcoder::Lookup.new }

  describe '#find_by_zip_code' do
    it 'calls right method' do
      expect_any_instance_of(Zipcoder::Lookup).to receive(
        :find_by
      )
      lookup.find_by_zip_code('1234')
    end
  end

  describe '#find_by_city' do
    it 'calls right method' do
      expect_any_instance_of(Zipcoder::Lookup).to receive(
        :find_by
      )
      lookup.find_by_city('Berlin')
    end
  end
end
