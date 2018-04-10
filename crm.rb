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

get '/contacts/new' do
  erb :new
end

get '/contacts/:id' do
  @contact = Contact.find_by(id: params[:id].to_i)
  if @contact
    erb :show_contact
  else
   raise Sinatra::NotFound
  end
end

get '/contacts/:id/edit' do
  @contact = Contact.find_by(id: params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

post '/contacts' do
  puts params
  Contact.create(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
  )
  redirect to('/contacts')
end

get '/about' do
  erb :about
end

after do
  ActiveRecord::Base.connection.close
end
