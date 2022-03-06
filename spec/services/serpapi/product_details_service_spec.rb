describe Serpapi::ProductDetailsService do
  context 'without valid parameters' do
    it 'returns with failure' do
      response = described_class.perform

      expect(response.success?).to be(false)
      expect(response.errors[:id]).to include('can\'t be blank')
      expect(response.errors[:user]).to include('can\'t be blank')
    end
  end

  context 'with valid parameters', :serpapi do
    let(:user)     { double }
    let(:response) { described_class.perform(user: user, id: 1) }

    before do
      allow(user).to receive(:locale).and_return('en')
    end

    it 'returns with success' do
      expect(response.success?).to be(true)
      expect(response.errors.size).to eq(0)
    end

    it 'returns product details with merchants' do
      expect(response.result.merchants.size).to eq(2)
      expect(response.result.merchants.first.amount).to be_nil
      expect(response.result.merchants.last.amount).to eq(5.00)
    end
  end
end
