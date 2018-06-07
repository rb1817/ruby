require 'sinatra'
require 'httparty'
require 'nokogiri'
require 'json'
require 'sinatra/reloader'



get '/menu' do 
    menu = ["햄버거","피자","치킨"]
    a = menu.sample(2)
    "점심에는 " + a[0] + "를 먹고 저녁에는 " + a[1] + "를 먹는다."
end

get '/lotto' do
my_num = *(1..45)
    my_lotto = num.sample(6).sort
    "이번주 추천 번호는 " + lotto.to_s + "입니다."
end

get '/check_lotto' do
    url = "http://m.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=809"
    lotto = HTTParty.get(url)  
    result = JSON.parse(lotto)
    numbers = []
    bonus = result["bnusNo"]
    result.each do |k,v|
        if k.include? ("drwtNo")
            numbers << v
        end
    end
    my_num = *(1..45)
    my_lotto = my_num.sample(6).sort
    
    count = 0
    numbers.each do |num|
        count += 1 if my_lotto.include?(num)
    end
    if (count == 6) 
        puts "1등"
    elsif (count == 5 && num.include?(bonus)) 
        puts "2등"
    elsif (count == 5) 
        puts "3등"
    elsif (count == 4) 
        puts "4등"
    elsif (count == 3) 
        puts "5등"
    else puts "꽝"
    end
end

get '/kospi' do
response = HTTParty.get("http://finance.daum.net/quote/kospi.daum?nil_stock=refresh")
kospi = Nokogiri::HTML(response)
result = kospi.css("#hyenCost > b").text
result
end

get '/html' do
    "<html>
        <head></head>
        <body>
            <h1>안녕하세요</h1>
        </body>
    </html>"
end

get '/html_file' do
    @name = params[:name]
    erb :my_first_html
end  

get '/calculate' do
    @a = params[:a].to_i
    @b = params[:b].to_i
    
    @q=@a+@b
    @w=@a-@b
    @e=@a*@b
    @r=@a/@b
    erb :sum_html    
end