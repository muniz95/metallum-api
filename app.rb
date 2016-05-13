require 'sinatra'

get '/' do
    'Hello World!'
end

get '/:number' do
    params["number"]
end