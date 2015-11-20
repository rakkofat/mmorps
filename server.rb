require "sinatra"
require "pry"
require_relative 'models/rps'

use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe"
}

get '/' do
  session[:rounds] ||= 0
  session[:rps_game] ||= RPS.new
  erb :game
end

post '/choose' do
  choice = params[:choice]
  session[:outcome] = session[:rps_game].round_outcome(choice)
  session[:rounds] += 1
  redirect '/'
end

get '/reset' do
  session.clear
  redirect '/'
end
