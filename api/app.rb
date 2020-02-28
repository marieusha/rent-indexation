require "sinatra"
require "sinatra/cross_origin"
require "pry-byebug"

set :bind, '0.0.0.0'

configure do
  enable :cross_origin
end

before do
  response.headers["Access-Control-Allow-Origin"] = "http://localhost:8080"
end

# ROUTES ...
options "*" do
  response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
  response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
  response.headers["Access-Control-Allow-Origin"] = "http://localhost:8080"
  200
end

post '/v1/indexations' do
  binding.pry
end
