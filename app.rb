#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "pizzashop.db"}

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
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

post '/cart' do
	@orders_input = params[:orders_input]
	@items = parse_orders_input @orders_input

	@items.each do |item|
		# id, cnt
		item[0] = Product.find(item[0])
	end

  	erb :cart
end

def parse_orders_input orders_input
		s1 = orders_input.split(/,/)
		arr = []
		s1.each do |x|
			s2 = x.split(/=/)
			s3 = s2[0].split(/_/)
			id = s3[1]
			cnt = s2[1]
			arr2 = [id, cnt]
			arr.push arr2
		end
	return arr
end

post '/place_order' do

	@o = Order.new params[:order]
	@o.save
	erb :order_placed
end
