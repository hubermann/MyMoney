Gem to convert from a currency to others

p "Default: "+ MyMoney.configuration.default_currency
conversiones = MyMoney.configuration.conversions

conversiones.each do |conversion|
  p "Available: #{conversion}"
end

money = MyMoney.new(30, 'EUR')

p "Inspect: " + money.inspect

MyMoney.configure do |config|
  config.default_currency = "AR"
  config.conversions = {
    'USD' => 1,
    'Bitcoin' => 0.0047,
    'AR' => 17
  }
end


p "Actual currency: " + money.currency
p "Default now: "+ MyMoney.configuration.default_currency
conversiones = MyMoney.configuration.conversions

conversiones.each do |conversion|
  p "Diponible: #{conversion}"
end




p "Actual currency : " + money.currency
p "Actual default: "+ MyMoney.configuration.default_currency
conversiones = MyMoney.configuration.conversions

conversiones.each do |conversion|
  p "Diponible: #{conversion}"
end

money.convert_to('AR')

p "Now is : "+ money.amount.to_s + " " + money.currency

twenty_dollars = MyMoney.new(20, 'USD')

p "20 USD >> : #{twenty_dollars.currency} >> #{twenty_dollars.amount}"

twenty_dollars.convert_to('AR')

p "Converted to AR: #{twenty_dollars.currency} >> #{twenty_dollars.amount}"

