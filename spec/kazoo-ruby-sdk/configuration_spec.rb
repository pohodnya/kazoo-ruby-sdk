require 'spec_helper'

module KazooRubySdk
  describe Configuration do
    describe '#auth_url=' do
      it 'can set value' do
        config = Configuration.new
        config.auth_url = 'http://test-url.ru'
        expect(config.auth_url).to eq('http://test-url.ru')
      end
    end
  end
end