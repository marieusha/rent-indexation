require 'open-uri'
require 'json'

class Indexator
  BASE = [1988, 1996, 2004, 2013]

  def base_index(base, base_year, base_month)
    JSON.parse(open("https://fi7661d6o4.execute-api.eu-central-1.amazonaws.com/prod/indexes/#{base}/#{base_year}-#{sprintf('%02i', base_month)}").read)["index"]["MS_HLTH_IDX"]
  end

  def current_index(base, current_year, current_month)
    JSON.parse(open("https://fi7661d6o4.execute-api.eu-central-1.amazonaws.com/prod/indexes/#{base}/#{current_year}-#{sprintf('%02i', current_month)}").read)["index"]["MS_HLTH_IDX"]
  end

  def base_month(signed_on)
  Date.parse(signed_on).prev_month.month
  end

  def base_year(signed_on)
    Date.parse(signed_on).prev_month.year
  end

  def base(signed_on)
    year = Date.parse(signed_on).prev_month.year
    BASE.reverse.find do |i|
      i <= year
    end
  end

  def current_month(start_date)
    last_birthday(start_date).month
  end

  def current_year(start_date)
    last_birthday(start_date).year
  end

  def last_birthday(start_date)
    start_date = Date.parse(start_date)
    last_birthday = Date.new(Date.today.year, start_date.month, start_date.day).prev_month
    last_birthday = last_birthday.prev_year if last_birthday > Date.today
    last_birthday
  end

  def compute_indexation(params)
    current_index = current_index(base(params["signed_on"]), current_year(params["start_date"]), current_month(params["start_date"]))
    base_index = base_index(base(params["signed_on"]), base_year(params["signed_on"]), base_month(params["signed_on"]))
    new_rent = params["base_rent"].to_i * current_index / base_index
    { new_rent: new_rent, base_index: base_index, current_index: current_index }
  end
end
