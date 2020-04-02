require 'indexator'
require "pry-byebug"

RSpec.describe Indexator do
  describe '#compute_indexation' do
    it 'returns the calculated response ' do
      body = {'signed_on' => '2010-07-25', 'start_date' => '2010-09-01', 'base_rent' => '500'}
      response = { new_rent: 584.1759801312755, current_index: 131.72, base_index: 112.74, base_rent: '500' }
      expect(Indexator.new.compute_indexation(body)).to eq response
    end

    it 'returns no indexation if contract is less than a year old' do 
      body = {'signed_on' => (Date.today - 2.months).strftime('%Y-%m-%d'), 'start_date' => (Date.today - 1.month).strftime('%Y-%m-%d'), 'base_rent' => '500'}
      expect{Indexator.new.compute_indexation(body)}.to raise_error(ArgumentError)
    end

    it 'returns error that signed on date must be in the past' do
      body = {'signed_on' => (Date.today + 1).strftime('%Y-%m-%d'), 'start_date' => '2019-09-01', 'base_rent' => '500'}
      expect{Indexator.new.compute_indexation(body)}.to raise_error(ArgumentError)
    end

    it 'returns error that start date must be in the past' do
      body = {'signed_on' => '2019-09-01', 'start_date' => (Date.today + 1).strftime('%Y-%m-%d'), 'base_rent' => '500'}
      expect{Indexator.new.compute_indexation(body)}.to raise_error(ArgumentError)
    end
  end
end


# first check params exist
# then run other checks

#check that last birthday is at least a year ago
# last_birthday != start_date


# if the contract started less than one year ago, there is no indexation. Meaning current_index = base_index. So, new_rent = base_rent

# if a very old contract (before 1982 for example), can't do the calculation (expect to raise_error rspec) 

# index not available for given date

#  raise ArgumentError.new "Index is not available for given date"
#  if result [index][0] = "not found"
# if params keys include 

# create method that checks params
# check signed on and start date in the past


