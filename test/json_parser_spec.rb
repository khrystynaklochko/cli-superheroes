require_relative 'spec_helper'
require "./json_parser"

describe 'Cards list' do
  let(:cards_json) { File.read('./test/cards_test.json') }
  it 'is fetched and returned sorted by set' do
    parser = JsonParser.new()
    parser.parse_by_set
    cards = parser.cards_by_set.first["10E"].count
    expect(cards).to eq(100)
  end
  
  it 'is fetched and returned sorted by KTK set' do
    parser = JsonParser.new()
    parser.parse_by_ktk
    cards = parser.cards_by_ktk.count
    expect(cards).to eq(0)
  end
end