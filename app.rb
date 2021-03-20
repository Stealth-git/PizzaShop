#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "pizzashop.db"}

class Product < ActiveRecord::Base
end

before do
	@products = Product.all
end

def is_boolean (index)
	if index == false
		erb "нет" 
	else 
		erb "да" 
	end
end

get '/' do
	erb :index		
end

get '/about' do
	erb :about		
end

get '/index' do
	erb :index		
end
