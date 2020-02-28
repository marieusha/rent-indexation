require "sinatra"
require "sinatra/cross_origin"
require "pry-byebug"
require_relative 'indexator'

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
  body = JSON.parse(request.body.read.to_s)
  # Indexator.new.(body).to_json
  # params = {
  # start_date: Date.parse('2010-01-01'),
  # signed_on: Date.parse('2009-12-01'),
  # rent: 500
  # }

result = Indexator.new.compute_indexation(body).to_json
result == {
  new_rent: 598.2392776523702,
  base_index: 110.75,
  current_index: 132.51
}
end
