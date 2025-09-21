class Stock < ApplicationRecord
  ### A stock can have many records in the user_stocks table
  has_many :user_stocks

  ### Gives access to the actual users associated with a stock
  has_many :users, through: :user_stocks

  validates :name, :ticker, presence: true

  ## Use the 'self.' to create an instance method
  def self.new_lookup(ticker)
    client = Alphavantage::Client.new key: "demo" # Rails.application.credentials.alphavantage[:free_api_key]

    begin
      stock = client.stock(symbol: ticker)
      overview = client.request("function=OVERVIEW&symbol=#{ticker}")

      ## Create new object
      new(ticker: ticker, name: overview["Name"], last_price: stock.quote.price)
    rescue
      nil
    end
  end
end
