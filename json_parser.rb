require 'yajl'

class JsonParser

  attr_accessor :parser_by_set, :parser_by_set_rarity, :parser_ktk, :cards_by_set, :cards_by_set_rarity, :cards_by_ktk

  def initialize()
    init_by_set
    init_by_set_rarity
    init_by_ktk
  end

  def init_by_set
    @cards_by_set = []
    @parser_by_set = Yajl::Parser.new(:symbolize_keys => true)
    @parser_by_set.on_parse_complete = lambda {|obj| @cards_by_set << obj[:cards].group_by{|c| c[:set]}}
  end
  
  def init_by_set_rarity
    @cards_by_set_rarity = []
    @parser_by_set_rarity = Yajl::Parser.new(:symbolize_keys => true)
    @parser_by_set_rarity.on_parse_complete = lambda {|obj|  obj[:cards].group_by{|c| c[:set]}
    .then{|g| g.keys.each{|k| @cards_by_set_rarity << "{:#{k}=>[#{g[k].group_by{|c| c[:rarity]}}]}"}}}
  end
  
  def init_by_ktk
    @cards_by_ktk = []
    @parser_by_ktk = Yajl::Parser.new(:symbolize_keys => true)
    @parser_by_ktk.on_parse_complete = lambda {|obj|  obj[:cards].group_by{|c| c[:set]}
    .then{|s| s['KTK'].each{|c| @cards_by_ktk << c if c[:colors] == ["Red", "Blue"]} if !s['KTK'].nil? }}
  end

  def parse_by_set
    File.open('cards.json', 'r') do |f|
      f.each(100) {|chunk| @parser_by_set << chunk}
    end
    puts @cards_by_set
  end
  
  def parse_by_set_rarity
    File.open('cards.json', 'r') do |f|
      f.each(100) {|chunk| @parser_by_set_rarity << chunk}
    end
    puts @cards_by_set_rarity
  end
  
  def parse_by_ktk
    File.open('cards.json', 'r') do |f|
      f.each(100) {|chunk| @parser_by_ktk << chunk}
    end
    puts @cards_by_ktk
  end
end
