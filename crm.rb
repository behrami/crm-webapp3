require_relative 'contact.rb'
require 'sinatra'

get '/' do
  redirect '/contacts'
end

get '/contacts' do
  @contactlist = Contact.all
  @contactnum= Contact.all.size
  erb :contacts
end

get '/contacts/:id' do
  @contact = Contact.find_by(id: params[:id].to_i)
  if @contact
    erb :show_contact
  else
   raise Sinatra::NotFound
  end
end

get '/new' do
  erb :new
end

get '/about' do
  erb :about
end

after do
  ActiveRecord::Base.connection.close
end
