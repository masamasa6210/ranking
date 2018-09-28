require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'kaminari'
require 'will_paginate-bootstrap'

require './models'

require 'open-uri'
require 'json'
require 'net/http'

get '/' do
    @ranks = User.page(params[:page]).per(100).order("effort_count desc")
    erb :daily
end

get '/daily' do
    @ranks = User.page(params[:page]).per(100).order("effort_count desc")
    erb :daily
end

get '/top' do
    @ranks = User.page(params[:page]).per(100).order("now_count desc")
    erb :top
end

get '/search/daily' do
    @ranks = User.page(params[:page]).per(100).where('user_id LIKE ?', "%#{params[:user_id]}%")
    
    erb :daily
end

get '/search/top' do
    @ranks = User.page(params[:page]).per(100).where('user_id LIKE ?', "%#{params[:user_id]}%")
    
    erb :top
end