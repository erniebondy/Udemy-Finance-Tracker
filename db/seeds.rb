# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
User.create(email: "john@mail.com", password: "password")
User.create(email: "tom@mail.com", password: "password")

Stock.create(ticker: "MSFT", name: "Microsoft", last_price: 123.32)
Stock.create(ticker: "GOOG", name: "Google", last_price: 321.21)
Stock.create(ticker: "AMZN", name: "Amazon", last_price: 213.12)
