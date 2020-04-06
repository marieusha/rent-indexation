require 'indexator'
require "pry-byebug"

RSpec.describe Indexator do
  describe '#compute_indexation' do

    it 'returns the correct calculated indexation response ' do
      body = {'signed_on' => '2010-07-25', 'start_date' => '2010-09-01', 'base_rent' => '500'}
      response = { new_rent: 584.1759801312755, current_index: 131.72, base_index: 112.74, base_rent: '500' }
      expect(Indexator.new.compute_indexation(body)).to eq response
    end

    it 'returns an ArgumentError if signed_on blank' do
      body = {'signed_on' => '', 'start_date' => '2010-09-01', 'base_rent' => '500'}  
      expect{Indexator.new.compute_indexation(body)}.to raise_error(ArgumentError)   
    end

    it 'returns an ArgumentError if start_date blank' do
      body = {'signed_on' => '2010-07-25', 'start_date' => '', 'base_rent' => '500'}  
      expect{Indexator.new.compute_indexation(body)}.to raise_error(ArgumentError)   
    end

    it 'returns an ArgumentError if base_rent blank' do
      body = {'signed_on' => '2010-07-25', 'start_date' => '2010-09-01', 'base_rent' => ''}  
      expect{Indexator.new.compute_indexation(body)}.to raise_error(ArgumentError)   
    end

    it 'returns an ArgumentError if contract is less than a year old' do 
      body = {'signed_on' => (Date.today - 2.months).strftime('%Y-%m-%d'), 'start_date' => (Date.today - 1.month).strftime('%Y-%m-%d'), 'base_rent' => '500'}
      expect{Indexator.new.compute_indexation(body)}.to raise_error(ArgumentError)
    end
  
    it 'returns an ArgumentError if signed_on date is not the past' do
      body = {'signed_on' => (Date.today + 1).strftime('%Y-%m-%d'), 'start_date' => '2019-09-01', 'base_rent' => '500'}
      expect{Indexator.new.compute_indexation(body)}.to raise_error(ArgumentError)
    end

    it 'returns an ArgumentError if start_date is not in the past' do
      body = {'signed_on' => '2019-09-01', 'start_date' => (Date.today + 1).strftime('%Y-%m-%d'), 'base_rent' => '500'}
      expect{Indexator.new.compute_indexation(body)}.to raise_error(ArgumentError)
    end

    it 'returns an ArgumentError if index is nil' do
      body = {'signed_on' => '1981-07-25', 'start_date' => '2010-09-01', 'base_rent' => '500'}
      expect{Indexator.new.compute_indexation(body)}.to raise_error(ArgumentError)
    end
  end
end




