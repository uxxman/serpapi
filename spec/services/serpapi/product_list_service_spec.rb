describe Serpapi::ProductListService do
  context 'without valid parameters' do
    it 'returns with failure' do
      response = described_class.perform

      expect(response.success?).to be(false)
      expect(response.errors[:user]).to include('can\'t be blank')
      expect(response.errors[:query]).to include('can\'t be blank')
    end
  end

  context 'with valid parameters', :serpapi do
    let(:response) { described_class.perform(user: OpenStruct.new(locale: 'en'), query: 'ipad') }

    it 'returns with success' do
      expect(response.success?).to be(true)
      expect(response.errors.size).to eq(0)
    end

    it 'returns matching products' do
      expect(response.result.size).to eq(2)
    end
  end
end