require_relative "http_connector"

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
    parse_json
  when "-cards-set-rarity"
    @options[:syntax_highlighting] = true
  when "-cards-ktk"
    @options[:syntax_highlighting] = true
  end
end

@options = {}
ARGV.each do |option|
  puts "Enter -h for help"  unless ["-cards-set", "-cards-set-rarity", "-cards-ktk"].include?(option)
  card_commands(option) 
end
