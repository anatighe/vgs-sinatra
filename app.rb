require 'sinatra'
require "sinatra/reloader" if development?

get '/' do
  erb :index
end

post '/payment' do
  "your payment has been posted"
end