require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require 'open-uri'
require 'json'
require 'net/http'
require 'oauth'
consumer_key = 'mYNlIsU4vDqAKyjts0sdDoA1l'
consumer_secret = 'g3D8pq4l24kLFBRzkOGJ9DPUgEuIwJJhUzWu4YTaGcu79BNVMA'
access_token = '3223138740-IwElJp0elZvLuFBpoBtMUnZMnuluMMvmNS9yTKK'
access_token_secret = 'ffGXqAgQhLlpuBtd73QOBdld2Zz8jamoc1qCo2bJtAvlF'

get '/' do
    uri = URI("https://kenkoooo.com/atcoder/atcoder-api/info/ac")
    res = Net::HTTP.get_response(uri)
    json = JSON.parse(res.body)
    @users = json
    
    erb :index
end

post '/tweet' do
    consumer = OAuth::Consumer.new(
        consumer_key,
        consumer_secret,
        site:"https://api.twitter.com"
    )
    endpoint = OAuth::AccessToken.new(consumer,
    access_token, access_token_secret)
    
    response = endpoint.post("https://api.twitter.com/1.1/statuses/update.json", status: params[:tweet])
    #result = JSON.parse(response.body)
    
    redirect "/"
end