require './lib/my_money'

p "El default now: "+ MyMoney.configuration.default_currency
conversiones = MyMoney.configuration.conversions

conversiones.each do |conversion|
  p "Diponible: #{conversion}"
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


p "El currency de la instancia money es: " + money.currency
p "El default now: "+ MyMoney.configuration.default_currency
conversiones = MyMoney.configuration.conversions

conversiones.each do |conversion|
  p "Diponible: #{conversion}"
end




p "El currency de la instancia money es: " + money.currency
p "El default now: "+ MyMoney.configuration.default_currency
conversiones = MyMoney.configuration.conversions

conversiones.each do |conversion|
  p "Diponible: #{conversion}"
end

money.convert_to('AR')

p "Ahora el monto es : "+ money.amount.to_s + " " + money.currency

twenty_dollars = MyMoney.new(20, 'USD')

p "20 dolares>> : #{twenty_dollars.currency} >> #{twenty_dollars.amount}"

twenty_dollars.convert_to('AR')

p "Convertidos a AR: #{twenty_dollars.currency} >> #{twenty_dollars.amount}"

########
#--Configurar la moneda default y sus respectivas conversiones (here, EUR)

MyMoney.configure do |config|
  config.default_currency = "EUR"
  config.conversions = {
    'USD' => 1.17,
    'Bitcoin' => 0.0047,
    'AR' => 17
  }
end

# Instanciar objeto

fifty_eur = MyMoney.new(50, 'EUR')
# - Get monto y moneda

fifty_eur.amount   # => 50
fifty_eur.currency # => "EUR"
fifty_eur.inspect  # => "50.00 EUR"

# - Convertir a otra moneda (Debe devolver una instancia, no un string)

fifty_eur.convert_to('USD') # => 55.50 USD

# - Realizar operaciones aritmeticas

twenty_dollars = MyMoney.new(20, 'USD')

p "inspeccion de twenty_dollars: #{twenty_dollars.inspect}"

twenty_dollars.convert_to('Bitcoin')
p "inspeccion de twenty_dollars convertidos a Bitcoin: #{twenty_dollars.inspect}"


p " #-#-#-#-#-#-#-#-#-#-#- "

treintaEuros = MyMoney.new(30, 'EUR')
p "Inspect de 30 euros #{treintaEuros.inspect}"

treintaEuros.convert_to('USD')
p "Inspect de 30 euros convertidos a USD #{treintaEuros.inspect} "

p " #-#-#-#-#-#-#-#-#-#-#- "

p MyMoney.default_currency
p MyMoney.conversions
p " #-#-#-#-#- SUMA #-#-#-#-#-#- "
p treintaEuros + treintaEuros

p " #-#-#-#-#- RESTA #-#-#-#-#-#- "
rs = treintaEuros - treintaEuros
p rs

p " #-#-#-#-#- DIVISION #-#-#-#-#-#- "
rs = treintaEuros / treintaEuros
p rs
p " #-#-#-#-#- Multiplicacion #-#-#-#-#-#- "
rs = treintaEuros * treintaEuros
p rs

p " #-#-#-#-#- Compare #-#-#-#-#-#- "
if(twenty_dollars > treintaEuros)
	puts "Es mayor"
end

