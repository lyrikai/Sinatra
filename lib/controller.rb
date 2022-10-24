require_relative 'gossip'
require_relative 'comment'
require 'csv'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
      Gossip.new(params["gossip_author"], params["gossip_content"]).save
      redirect '/'
  end

  get '/gossips/:id/' do

    erb :gossip_index, locals: {gossips: Gossip.all, comment: Comment.all}
    
  end

  post '/gossips/:id/' do
    Comment.new(params["com_author"], params["com_content"],  params["id"]).save_com
    test =  params["id"].to_i
    redirect back
  end

  get '/gossips/:id/edit/' do

    erb :edit, locals: {gossips: Gossip.all}
    
  end

  post '/gossips/:id/edit/' do
    puts "Ceci est le contenu du hash params : #{params}"
    Gossip.new(params["gossip_author"], params["gossip_content"], params["id"]).modif
    redirect back
  end

end