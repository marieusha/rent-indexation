require 'open-uri'
require 'json'

def Indexator
  def initialize()
  end

  def base_index()
  end

  def current_index()
  end

  def base_month(signed_on)
    puts signed_on
  end

  def call(base, base_year, base_month)
    response = open("https://fi7661d6o4.execute-api.eu-central-1.amazonaws.com/prod/indexes/#{base}/#{base_year}-#{base_month}")
    json = JSON.parse(response.read)
    json
  end
end
