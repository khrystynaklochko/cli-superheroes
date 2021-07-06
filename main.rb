require_relative "http_connector"
require_relative "json_parser"

@parser = JsonParser.new()
def card_commands(option)
  case option
  when "-h"
    puts "Available commands"
    puts "  -cards-set List of cards grouped by set."
    puts "  -cards-set-rarity List of cards grouped by set and within each set grouped by rarity."
    puts "  -cards-ktk List of cards from the Khans of Tarkir (KTK) set that ONLY have the colours red AND blue."
    exit
  when "-cards-set"
    fetch_cards
    @parser.parse_by_set
  when "-cards-set-rarity"
    fetch_cards
    @parser.parse_by_set_rarity
  when "-cards-ktk"
    fetch_cards
    @parser.parse_by_ktk
  end
end

@options = {}
ARGV.each do |option|
  puts "Enter -h for help"  unless ["-cards-set", "-cards-set-rarity", "-cards-ktk"].include?(option)
  card_commands(option) 
end
