require 'httparty'
require 'nokogiri'

url = "https://api.bithumb.com/trade/market_sell"

while true
    response = HTTParty.get(url)    # URL을 통해 요청
    doc = Nokogiri::HTML(response)  # Nokogiri로 저장 (컴퓨터가 찾기 쉽게)
    kospi = doc.css("#assetRealBTC") # css 통해 서칭
    sleep 5
    puts kospi
    puts kospi.text
end

#puts kospi
puts kospi.text     # Tag 안에 있는 텍스트만 가져옴