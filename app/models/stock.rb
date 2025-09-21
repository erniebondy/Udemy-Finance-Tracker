class Stock < ApplicationRecord
  ## Use the 'self.' to create an instance method
  def self.new_lookup(ticker_symbol)
    client = Alphavantage::Client.new key: "demo" # Rails.application.credentials.alphavantage[:free_api_key]


    begin
      stock = client.stock(symbol: ticker_symbol)
      overview = client.request("function=OVERVIEW&symbol=#{ticker_symbol}")

      ## Create new object
      new(ticker: ticker_symbol, name: overview["Name"], last_price: stock.quote.price)
    rescue
      nil
    end
  end
end
