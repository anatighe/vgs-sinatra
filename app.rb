require 'sinatra'
require "sinatra/reloader" if development?
require 'uri'
require 'json'
require 'net/https'

get '/' do
  erb :index
end

post '/payment' do
  url = 'https://tntzm812agt.sandbox.verygoodproxy.com'
  uri = URI.parse('https://tntzm812agt.sandbox.verygoodproxy.com')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Post.new(url, initheader = {'Content-Type' =>'application/json'})
  request.body = {account_number: 'ACC00000000000000000', cc_number: params['cc_number'], cc_exp: params['expiration'], cvv: params['cvv']}.to_json
  response = http.request(request)
  "Response #{response.code} #{response.message}: #{response.body}"
end

post '/' do
  puts "Data:  recieved, creating object."
  status 201
end

get '/secure' do
  proxy = URI.parse('http://USiyQvWcT7wcpy8gvFb1GVmz:2b48a642-615a-4b3c-8db5-e02a88147174@tntsfeqzp4a.sandbox.verygoodproxy.com:8080')
  uri = URI.parse('https://echo.apps.verygood.systems/post')
  http = Net::HTTP.new(uri.host, uri.port, proxy.host, proxy.port, proxy.user, proxy.password)
  http.use_ssl = true
  http.ca_file = '.ssl/cert.pem'
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER
  http.verify_depth = 5

  request = Net::HTTP::Post.new(uri.path, initheader = {'Content-Type' =>'application/json'})
  request.body = {account_number: 'tok_sandbox_w8CBfH8vyYL2xWSmMWe3Ds', cc_number: 'encryptedno', cc_exp: 'encryptedexp', cvv: 'encryptedcvv'}.to_json
  response = http.request(request)
  puts "Response #{response.code} #{response.message}: #{response.body}"
  "Thanks, we've retrieved your secure data!"
end