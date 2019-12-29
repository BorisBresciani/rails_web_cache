# frozen_string_literal: true

RSpec.describe RailsWebCache do
  it 'returns a RailsWebCache::MemoryStore class' do
    expect(RailsWebCache.cache).to be_a_kind_of(RailsWebCache::MemoryStore)
  end

  it 'returns a raise errors' do
    expect { RailsWebCache.send(:driver, 'test') }.to raise_error(ArgumentError)
  end

  it 'returns 1 key' do
    Rails.cache.write('RailsWebCache', 'RailsWebCache')
    expect(RailsWebCache.cache.keys_size).to eql(1)
  end

  it 'returns 0 key' do
    RailsWebCache.cache.clear
    expect(RailsWebCache.cache.keys_size).to eql(0)
  end

  it 'returns RailsWebCache key' do
    Rails.cache.write('RailsWebCache', 'RailsWebCache')
    expect(RailsWebCache.cache.read('RailsWebCache')).to eql('RailsWebCache')
  end

  it 'returns 0 key (delete)' do
    Rails.cache.write('RailsWebCache', 'RailsWebCache')
    RailsWebCache.cache.delete('RailsWebCache')
    expect(RailsWebCache.cache.keys_size).to eql(0)
  end

  it 'returns RailsWebCache key by search' do
    Rails.cache.write('RailsWebCache', 'RailsWebCache')
    expect(RailsWebCache.cache.search('RailsWebCache')).to eql(['RailsWebCache'])
  end
end
