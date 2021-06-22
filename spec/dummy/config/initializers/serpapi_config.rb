Serpapi.configure do |config|
  config.update_merchant = lambda do |merchant, _|
    if merchant.name == 'saturn.de'
      merchant.unit   = '%'
      merchant.amount = 5.00
    end
  end
end
