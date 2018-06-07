touch sinatra.rb - 파일 생성
ruby sinatra.rb - 파일 실행

require 'sinatra'
get '/menu' do 
    menu = ["햄버거","피자","치킨"]
    a = menu.sample(2)
    "점심에는 " + a[0] + "를 먹고 저녁에는 " + a[1] + "를 먹는다."
end

MVC 

ruby sinatra.rb -o $IP -p $PORT 

19, 22, 27, 34, 36, 45

gem install httparty - 라이브러리 다운

https://sinatra-1-rb2978.c9users.io/html_file?name=hello -> ? 다음은 파라미터

require 'sinatra/reloader' 바로 적용

html -> send_file "views/파일명"
erb -> erb :파일명

파일명.erb(파일명.html.erb) 파일형식 임베디드 루비


.rb 파일
get '/html_file' do    
@name = params[:name]    @를 붙여 허가한다.
erb :my_first_html
end


.erb 파일 
<html>        
<head></head>        
<body>            
<h1>안녕하세요? 저는 <%=@name%>입니다.</h1>   @를 붙여 허가한다.
</body>
</html>

클라이언트->서버->view->클라이언트