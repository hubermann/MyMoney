
#
# Gabriel Hubermann | Hubermann@gmail.com
#

class MyMoney
  include Comparable
  attr_accessor :amount, :currency

  def initialize(amount, currency)
	self.amount = amount
	self.currency = currency
  end
  
  def inspect
	"#{amount} #{currency}"
  end

  def convert_to(future_currency)
    self.class.configuration.conversions.each do |name_currency, value_currency|
      if name_currency == future_currency
        convert(name_currency,value_currency)
      end
    end
  end

  def convert(name_currency,value_currency)
    self.amount = self.amount * value_currency
    self.currency = name_currency
    self.class.new(self.amount, self.currency)
  end

  def self.conversions
  	self.configuration.conversions
  end

  def self.default_currency
  	self.configuration.default_currency
  end

  ### Compare ###
  def <=>(compare_item)
  	compare_item.convert_to(self.currency)
    self.amount <=> compare_item.amount
  end

  ### Math operations ###
  def +(math_item)
  	math_item.convert_to(self.currency)
    self.amount = self.amount + math_item.amount
    self
  end

  def -(math_item)
    math_item.convert_to(self.currency)
    self.amount = self.amount - math_item.amount
    self
  end

  def /(math_item)
    math_item.convert_to(self.currency)
    if self.amount > 0 || math_item.amount > 0
    	self.amount = self.amount / math_item.amount
  	end
    self
  end

  def *(math_item)
    math_item.convert_to(self.currency)
    self.amount = self.amount * math_item.amount
    self
  end


  ### Self Class Configuration ###
  class Configuration
    attr_accessor :conversions, :default_currency

    def initialize
      self.default_currency = "EUR"
      self.conversions ||= {}
    end
  end

  class << self
    attr_accessor :configuration, :currency, :amount
  end

  def self.configuration
    @configuration ||=  Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end

end
