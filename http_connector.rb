require 'uri'
require 'net/http'
require 'yajl'

def fetch_cards
  uri = URI('https://api.magicthegathering.io/v1/cards')
  Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
    request = Net::HTTP::Get.new(uri)
    http.request(request) do |response|
      if response.is_a?(Net::HTTPSuccess)
        open('cards.json', 'w') do |file|
          response.read_body do |chunk|
            file.write(chunk)
          end
        end
      end
    end
  end
end