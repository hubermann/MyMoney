require 'minitest/autorun'
require '../lib/my_money'

class MyMoneyTest < Minitest::Test


	describe "Check values from converter class by default " do

    def setup
      @bono = MyMoney.new(30, 'EUR')
    end

    it "the currency name must be 'EUR'" do
      @bono.currency.must_equal 'EUR'
    end

    it "the currency must be 30 " do
      @bono.amount.must_equal 30
    end

    it "the inspect method must be return amount and currency" do
      @bono.inspect.must_equal "30 EUR"
    end

  end

  describe "Conversion process " do
    def setup
    	@bono = MyMoney.new(30, 'EUR')
    	MyMoney.configure do |config|
			  config.default_currency = "EUR"
			  config.conversions = {
			    'USD' => 1.17,
			    'Bitcoin' => 0.0047,
			    'AR' => 17
			  }
			end
    end

  	it "Converted to USD the value change" do
    	@bono.convert_to('USD')
      @bono.amount.must_equal 35.099999999999994
    end

    it "Converted to AR the value change" do
    	@bono.convert_to('AR')
      @bono.amount.must_equal 510
    end
  end

  describe "Math and compare " do
    def setup
    	@treintaEuros = MyMoney.new(30, 'EUR')
 			@twenty_dollars = MyMoney.new(20, 'USD')
    end

  	it "Compare 20 USD > 30 EUR" do
    	rs = @twenty_dollars > @treintaEuros
    	rs.must_equal false
    end

    it "Compare 20 USD < 30 EUR" do
    	rs = @twenty_dollars < @treintaEuros
    	rs.must_equal true
    end
 
  end

end