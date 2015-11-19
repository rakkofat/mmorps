require "sinatra"
require_relative 'models/rps'

use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe"
}



rps_game = RPS.new



get '/' do
  session[:rounds] = 0
  # session[:visit_count].nil? ? session[:visit_count] = 1 : session[:visit_count] += 1
  session[:rps_game] = rps_game
  erb :game
end

post '/choose' do
  session[:rps_game]= session[:rps_game]
  session[:choice] = params[:choice]
  session[:rounds] += 1
  # rps_game.evaluate(@choice)
  # binding.pry
  erb :game
end

post '/reset' do
  session.clear
  redirect '/'
end
