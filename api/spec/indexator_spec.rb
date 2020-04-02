require 'indexator'
require "pry-byebug"

RSpec.describe Indexator do
  describe '#compute_indexation' do
    # 1. Check params are present
    it 'returns an error if signed_on blank' do
      body = {'signed_on' => '', 'start_date' => '2010-09-01', 'base_rent' => '500'}  
      expect{Indexator.new.compute_indexation(body)}.to raise_error(ArgumentError)   
    end

    it 'returns an error if start_date blank' do
      body = {'signed_on' => '2010-07-25', 'start_date' => nil, 'base_rent' => '500'}  
      expect{Indexator.new.compute_indexation(body)}.to raise_error(ArgumentError)   
    end

    it 'returns an error if base_rent blank' do
      body = {'signed_on' => '2010-07-25', 'start_date' => '2010-09-01', 'base_rent' => ''}  
      expect{Indexator.new.compute_indexation(body)}.to raise_error(ArgumentError)   
    end

    # 2. Check reponse completes calculation correctly
    it 'returns the calculated response ' do
      body = {'signed_on' => '2010-07-25', 'start_date' => '2010-09-01', 'base_rent' => '500'}
      response = { new_rent: 584.1759801312755, current_index: 131.72, base_index: 112.74, base_rent: '500' }
      expect(Indexator.new.compute_indexation(body)).to eq response
    end

    # 3. Checks that contract is not less than a year old
    it 'returns no indexation if contract is less than a year old' do 
      body = {'signed_on' => (Date.today - 2.months).strftime('%Y-%m-%d'), 'start_date' => (Date.today - 1.month).strftime('%Y-%m-%d'), 'base_rent' => '500'}
      expect{Indexator.new.compute_indexation(body)}.to raise_error(ArgumentError)
    end
    # 4. Checks that signed_on and start_date are in the past
    it 'returns error if signed_on date is not the past' do
      body = {'signed_on' => (Date.today + 1).strftime('%Y-%m-%d'), 'start_date' => '2019-09-01', 'base_rent' => '500'}
      expect{Indexator.new.compute_indexation(body)}.to raise_error(ArgumentError)
    end

    it 'returns error if start_date is not in the past' do
      body = {'signed_on' => '2019-09-01', 'start_date' => (Date.today + 1).strftime('%Y-%m-%d'), 'base_rent' => '500'}
      expect{Indexator.new.compute_indexation(body)}.to raise_error(ArgumentError)
    end

    # it 'returns an error if current_index is nil' do
    #   body = {'signed_on' => '1981-07-25', 'start_date' => '2010-09-01', 'base_rent' => '500'}
    #   expect{Indexator.new.compute_indexation(body)}.to raise_error(ArgumentError)
    # end
  end
end

# if a very old contract (before 1982 for example), can't do the calculation (expect to raise_error rspec) 

# index not available for given date

#  raise ArgumentError.new "Index is not available for given date"
#  if result [index][0] = "not found"
# if params keys include 



