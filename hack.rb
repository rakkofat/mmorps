# HTTP/1.1 200 OK
# Content-Type: text/html;charset=utf-8
# Content-Length: 693
# X-Xss-Protection: 1; mode=block
# X-Content-Type-Options: nosniff
# X-Frame-Options: SAMEORIGIN
# Server: WEBrick/1.3.1 (Ruby/2.2.3/2015-08-18)
# Date: Thu, 19 Nov 2015 20:47:19 GMT
# Connection: Keep-Alive
# Set-Cookie: rack.session=BAh7CUkiD3Nlc3Npb25faWQGOgZFVEkiRTMwYTEwYTc2OTQwZmJlZTBmYmQ4%0AOGRiNzE0MjVmMjBlNjZkZTM1ZmI5NDdjOTk0ZTg4MTk0MWZkOWQ5ZWY1MTMG%0AOwBGSSILcm91bmRzBjsARmkGSSINcnBzX2dhbWUGOwBGbzoIUlBTCDoSQHBs%0AYXllcl9zY29yZWkGOhRAY29tcHV0ZXJfc2NvcmVpADoMQHdpbm5lcjBJIgtj%0AaG9pY2UGOwBGSSIKUGFwZXIGOwBU%0A--bc97dc499629b3f3c3f2d1acb4adeaae05e9c838; path=/; HttpOnly

require 'uri'
require 'openssl'
require_relative 'models/rps'

session = "BAh7CUkiD3Nlc3Npb25faWQGOgZFVEkiRTMwYTEwYTc2OTQwZmJlZTBmYmQ4%0AOGRiNzE0MjVmMjBlNjZkZTM1ZmI5NDdjOTk0ZTg4MTk0MWZkOWQ5ZWY1MTMG%0AOwBGSSILcm91bmRzBjsARmkGSSINcnBzX2dhbWUGOwBGbzoIUlBTCDoSQHBs%0AYXllcl9zY29yZWkGOhRAY29tcHV0ZXJfc2NvcmVpADoMQHdpbm5lcjBJIgtj%0AaG9pY2UGOwBGSSIKUGFwZXIGOwBU%0A"
def decode_session(str)
  Marshal.load(URI.decode_www_form_component(str).unpack("m").first)
end

def generate_hmac(data, secret)
  OpenSSL::HMAC.hexdigest(OpenSSL::Digest::SHA1.new, secret, data)
end

p decode_session(session)

decoded_session = '{"session_id"=>"30a10a76940fbee0fbd88db71425f20e66de35fb947c994e881941fd9d9ef513", "rounds"=>1, "rps_game"=>#<RPS:0x007f8a2a025880 @player_score=2, @computer_score=0, @winner=nil>, "choice"=>"Paper"}'

p generate_hmac(decoded_session, "keep_it_secret_keep_it_safe")

winning_session = "72a3f727e044f40d9bfb108edff0abddf536084a"
