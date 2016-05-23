require 'json'
require 'nokogiri'
require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/album'
require_relative 'lib/band'
require_relative 'lib/parse'
require_relative 'lib/url'

get '/' do
  'Hello World!'
end

get '/band/:name' do
  html = Parse.get_json(Url.BAND(params['name']))
  direct_link = Nokogiri::HTML(html["aaData"][0][0]).css('a')
  direct_link.map{ |link|
    res = Band.show_band_page(Parse.get_url(link['href']))
    res.to_json
  }
end

get '/album/:name' do
  html = Parse.get_json(Url.ALBUM(params['name']))
  direct_link = Nokogiri::HTML(html["aaData"][0][1]).css('a')
  direct_link.map{ |link|
    res = Album.show_album_page(Parse.get_url(link['href']))
    res.to_json
  }
end

get '/:number' do
  params['number']
end
