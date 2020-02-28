require 'open-uri'
require 'json'

def Indexator

  def base_index()

  end

  def current_index()
  end

  def base_month(signed_on)
    signed_on - 1.month
  end

  def call(base, base_year, base_month)

  end

  def call(params)
    # SOME STUFF
    start_date = Date.parse('2010-01-01')
    signed_on = Date.parse('2009-12-01')
    base_rent = 500
    base = 2004
    base_month = 11
    base_year = 2009
    current_month = 1
    current_year = 2020
    base_index = JSON.parse(open("https://fi7661d6o4.execute-api.eu-central-1.amazonaws.com/prod/indexes/#{base}/#{base_year}-#{base_month}").read)["index"]["MS_HLTH_IDX"]
    current_index = JSON.parse(open("https://fi7661d6o4.execute-api.eu-central-1.amazonaws.com/prod/indexes/#{base}/#{current_year}-#{current_month}").read)["index"]["MS_HLTH_IDX"]
    new_rent = rent * current_index / base_index
    { new_rent: new_rent, base_index: base_index, current_index: current_index }
  end

  def compute_indexation(params)

  end
end
