require 'sinatra'
require "sinatra/reloader" if development?
require 'uri'
require 'json'
require 'net/https'

get '/' do
  erb :index
end

post '/payment' do
  uri = URI.parse('https://tntzm812agt.SANDBOX.verygoodproxy.com/')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Post.new(uri.path, initheader = {'Content-Type' =>'application/json'})
  request.body = {account_number: 'ACC00000000000000000'}.to_json
  response = http.request(request)
  puts "Response #{response.code} #{response.message}: #{response.body}"

  "your payment has been posted"
end